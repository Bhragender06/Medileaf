CREATE TABLE public.recycling_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  wrappers integer NOT NULL DEFAULT 0 CHECK (wrappers >= 0 AND wrappers <= 500),
  bottles integer NOT NULL DEFAULT 0 CHECK (bottles >= 0 AND bottles <= 500),
  expired integer NOT NULL DEFAULT 0 CHECK (expired >= 0 AND expired <= 500),
  tracking_number text NOT NULL DEFAULT '',
  note text NOT NULL DEFAULT '',
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'verified', 'rejected')),
  verified_count integer CHECK (verified_count IS NULL OR verified_count >= 0),
  verified_at timestamptz,
  verified_by uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CHECK (wrappers + bottles + expired > 0)
);
CREATE INDEX recycling_submissions_user_idx ON public.recycling_submissions(user_id);

GRANT SELECT, INSERT ON public.recycling_submissions TO authenticated;
GRANT ALL ON public.recycling_submissions TO service_role;
ALTER TABLE public.recycling_submissions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own returns select" ON public.recycling_submissions FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "own returns insert" ON public.recycling_submissions FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = user_id AND status = 'pending' AND verified_count IS NULL AND verified_at IS NULL AND verified_by IS NULL);

CREATE TABLE public.reward_claims (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  tier integer NOT NULL CHECK (tier IN (50, 100, 150)),
  seeds text[] NOT NULL DEFAULT '{}',
  ship_name text NOT NULL DEFAULT '',
  ship_address text NOT NULL DEFAULT '',
  ship_phone text NOT NULL DEFAULT '',
  status text NOT NULL DEFAULT 'processing' CHECK (status IN ('processing', 'shipped', 'delivered')),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, tier)
);
CREATE INDEX reward_claims_user_idx ON public.reward_claims(user_id);

GRANT SELECT, INSERT ON public.reward_claims TO authenticated;
GRANT ALL ON public.reward_claims TO service_role;
ALTER TABLE public.reward_claims ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own claims select" ON public.reward_claims FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "own claims insert" ON public.reward_claims FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

-- Seed rewards can only be claimed once the user's verified returns reach the tier.
CREATE OR REPLACE FUNCTION public.validate_reward_claim()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  total integer;
BEGIN
  SELECT COALESCE(SUM(verified_count), 0) INTO total
  FROM public.recycling_submissions
  WHERE user_id = NEW.user_id AND status = 'verified';
  IF total < NEW.tier THEN
    RAISE EXCEPTION 'You need % verified items to claim this reward (you have %)', NEW.tier, total;
  END IF;
  IF cardinality(NEW.seeds) < 1 OR cardinality(NEW.seeds) > 3 THEN
    RAISE EXCEPTION 'Choose 1 to 3 seed varieties';
  END IF;
  IF NOT (NEW.seeds <@ ARRAY['sunflower', 'marigold', 'lavender', 'wildflower', 'chamomile']::text[]) THEN
    RAISE EXCEPTION 'Unknown seed variety';
  END IF;
  IF length(trim(NEW.ship_name)) = 0 OR length(trim(NEW.ship_address)) < 10 THEN
    RAISE EXCEPTION 'Add a delivery name and full address';
  END IF;
  NEW.status := 'processing';
  NEW.created_at := now();
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;
REVOKE EXECUTE ON FUNCTION public.validate_reward_claim() FROM PUBLIC, anon, authenticated;

CREATE TRIGGER reward_claims_validate
BEFORE INSERT ON public.reward_claims
FOR EACH ROW EXECUTE FUNCTION public.validate_reward_claim();