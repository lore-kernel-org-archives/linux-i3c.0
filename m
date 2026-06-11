Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F63CD98C5
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTj/O1RpKR+5OxHdGe6Jlv6f5NL6swx9ggt/UV8HrR0=; b=hGZpPMPxWgQ9CwyJgtWk76Zi2k
	aiFfwnF1RoMvZPgXKDP30sQcl/ltSidOH1+xpZ+ENPOgdibFTQFEPHby71k2Y1rUVELm5obpmZA9d
	N+mWnf4tA7hNhqWR5QWr3i8OUaZZwaoHCdcOp/BVRND0v1wyzrBNMsH6oQBgDedB98h6Wj/ISn0N2
	D/KwyZt5ganRVIcv/ZZgoh85RkqjGdnalEihBN0RFVhjy+yyxMQXMeTt+FyYfKyqqMmYPQZ/XwwR7
	hrDUwx3IMhXlA7CJOg4TiXAS15P5jbtbz6tuawYE1H87mobJ0lseIF6g5LWsQMtsCdWlo/SrzQUSw
	qrqK1cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYr9a-0000000DGt8-2swX;
	Sun, 14 Jun 2026 20:09:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhRY-00000009gpZ-0nLW
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jun 2026 15:35:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-460662fcb4eso721384f8f.0
        for <linux-i3c@lists.infradead.org>; Thu, 11 Jun 2026 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781192142; x=1781796942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PSf1G7nzPbDLNKS1hhi7niyN8o55l0yM7rdHv8DgAgc=;
        b=I744PxFRhCrgNlraNck0KODboOwawtivPmlnOdNdQF4dfl7vb57fryuEdQetVuZO2M
         u6ZGG7CtX/8UpDGNsY6ozuifFFt50u27Z9A5t3PdpNzdoL/EvuxavDhAEuYVD44XAXqR
         x2KrRC7/j9x/kzb4YNT8QKrQQ6Q6bmSZXdgr3rzqq8FLIFp6kKLAD1cTF8BHoDQzIU3A
         GIguddfJdVCgduE4vic7ZITYJbYnIpZ02Nco7qNfIn/oyr0MsWzEo4ebQUK74HbOLDaf
         ouA3MYqYzqbqxNHQJeOw4R8S0cr9eQwOa4sUo33EKKUaiOorj5j0F46q72ZK70Mmwzj7
         uqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781192142; x=1781796942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSf1G7nzPbDLNKS1hhi7niyN8o55l0yM7rdHv8DgAgc=;
        b=NcDEBPuUvtx/H8ee9CoWcbHc6BaDxxNshT1if3gZQxmqF4aibAKFmkivutXe72hIJi
         jWHf0bWmlRrwDJ92+em3O4nRVUBp6Qt7rKqHUcyZsb/goipQhIGVtN/YHCai8h/LNwac
         9g7QmVzShhnEa4y0+ex3Mfy6a/lpcfuvUjizS0Gekb2hWhHIp4RkZIgUt0YvrT28jwSz
         Hh+zzIx8M9gfkLIZc+e7fpCHJSOGC+p6JaQxEl0E+EA1IIrVHdXFz/c+GR7CYajKD5uy
         2Cfr/+9GnLfkENIaoFXKQuuPREzeaaa/rznVJdenX5HME9ljVy/Ent//1QL3nNBiyAWa
         DQeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+kB36qGJAVZO1WwauDKRlYF2s3ISICVway8Scx8vFD5amE/UyFwd+CqYBve3riVACaj1g3kP3YfY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL9qlNGkWfhWdS9XCQFgL5eV7k1BLz+uQZ29aqV/1ldLdVMGDP
	X7Egl6HVVett9xT+JFw1H7rH7N83Ga7/BPDvZIazJcVVIxHPXkutsR6THwg3kdvj0uE=
X-Gm-Gg: Acq92OEFZV+xEHm1ed4F36hOpwlWqBjW+DjGd0bWHkw5vS9FVs0FdRRHQgJqtY2tMfC
	IPNp4K42PU+reB4w/t9l0K1DGdLQmqh9vUo1rDgUoL/9+jdygvGzPZQQWriHOOC6enyDacsBR2a
	1W73mmXH7lU1kW/6sxcz7WvrcLTlXZdFV74ta6wr1BHGTt2VK3DM5B0hqZqCuIBjqznwDa05NmT
	v2q3ATJLv2Bkmz63Ki1BVyvVaqM7xSahaRytdKyGSB19OsMcDTr8ddWbajNk6GVvAotGPoHJ3KB
	x+emRSo70/i0SmrSA83RBPAN3catgsc7pIbEogpH+8OcUnr5xyIIJdamBDmRXOasYNvSxRw8AQS
	bUBpr2jFlT18UkAshZydgkd9MEic/3ZO1++/2LIS5XmJd5GhhutOHmc9AUBmGPvkEtogYFk/IyO
	lr7M1pKBp3QauBZVPuLcSQ+QwT+BNV0CurJnW2rSm3gW1UhihEbPSN4A+O7lJXjsEThF2dmTskF
	kiNfjBKQF//mOcufwv9IQDIB2pmQNuUO3rU
X-Received: by 2002:a5d:5d11:0:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-460677cabc2mr4882372f8f.22.1781192142310;
        Thu, 11 Jun 2026 08:35:42 -0700 (PDT)
Received: from localhost (p200300f65f47db044fe8500d14a9bb87.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4fe8:500d:14a9:bb87])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35fb24sm88360173f8f.34.2026.06.11.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 08:35:41 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:35:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
	Frank Li <Frank.Li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
Message-ID: <airVk0itH1m03Qmp@monoceros>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_083544_686787_5B7F455D 
X-CRM114-Status: GOOD (  11.92  )
X-Mailman-Approved-At: Sun, 14 Jun 2026 13:09:57 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2800063722594923556=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============2800063722594923556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfq7rxhzmb4i53ds"
Content-Disposition: inline


--tfq7rxhzmb4i53ds
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

Hello,

On Mon, May 04, 2026 at 04:33:15PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The .driver_data member of the various struct pci_device_id arrays were
> initialized by list expressions. This isn't easily readable if you're
> not into PCI. Using named initializers is more explicit and thus easier
> to parse.
>=20
> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Given the feedback for this patch was positive and there is no change to
the compiled result, I wonder if it's still possible to get this into
v7.2-rc1?!

Best regards
Uwe

--tfq7rxhzmb4i53ds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoq1ckACgkQj4D7WH0S
/k6JAwf/eE4rafDRI0IcfdEXTxm6z6/tLnvQH335rz6tVtYE8so4q8Mlfsu3gm0V
bwSSvgK86jwfqDukENeNjQ8sg6RNiA+EfDCWOJ8YqZyjd9b+6CPebkXY/c4LrwT3
IlT03FFG27c+ZZdT/F4a0MMgDJhEzzRV91/hhka1Af4TZUe0qEwlLkOjdYYlLcmy
KSDOBwpA1ncPbQkIbYRDNFubYnN2quOJ4As8T/2BU9yVk94Pk6WSXLxpeXU0RXq0
kvO+2ldEe0/T8qyQrLN7IMs/ASdO7XkS4NUvDzqeHisa1ASSTdBo/R5ub2HvWt6X
g6N2ESEkWsgQbuVs9uKt89wBUfO5Ew==
=z22G
-----END PGP SIGNATURE-----

--tfq7rxhzmb4i53ds--


--===============2800063722594923556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============2800063722594923556==--

