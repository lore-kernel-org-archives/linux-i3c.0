Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A5C7EE33
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJAD93xdQPtofQtVXgp/QNJX8d4Tx5w2+EINZNEhnCA=; b=jorowvYkwZ8TwSd4t4y4CFBvHQ
	JTIr9BD3e1AL1sYnHIbyVHW/ZklsGdzwh/+qUnEtrzm087fJVWrBW5l6JF3ZuonoZ/O/H+4YulPEU
	Vrg/qwC/Crtw6KJgfwmSkGq8IG8Q8l78u0xL6LJ1vDNrvtFiwTWAfpk5BfijQ/6xHBLXZ26pq1b0G
	T8JezXqQCWkhv7Bdia1jFxmdWupaiK3j262pzjXOdQycO7+TmBVCbG0PqNJ8MZToApu0DARaRX7vq
	K1kFdO/+CLnErVF3Dv2+wT67WdHn5JoU1Sa5xLTcipp44bgeeWXiz75ZQZbu8pJi42La3FBSAUqQn
	3KQdXt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYt-00000004EmW-2qZl;
	Tue, 24 Jun 2025 00:30:55 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUP4-000000071kz-2L3k
	for linux-i3c@lists.infradead.org;
	Tue, 17 Jun 2025 11:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R31m
	fLVjC+uIfwrmWjgoOWoNymzfUBxIN2PR9MEKejw=; b=f4aGZJ0r2eY9FL211LTc
	nBiYVCeQ1pBudoLeBYLQxlbaM1mL5H1tfTTxIwqBZWXNWEgJpJGgN4Dh9sEakL+e
	4Yy2taOaUTWy8tTaAr56THFNC+j5b0/wKhhiO1TUhc7VGDZokn8ixZMSpGZWchs7
	g/bCnj/+Qb6F10q/hATqYeNVDEr+hB1MM5pYQpmmAw/m6XgmLfmWNobliZ+EevWW
	E/pE+ZoyFzRiDxnD5V6K85V8ukevLfTSROb5shxqLmNP9OL3jUg30I+WnCrKrqIX
	5w5VI3235dta7q88KtlL5hokZqFBC0rlwYXySKlGXqjQRVIRLpk6kgqsy3ZxDt0i
	5A==
Received: (qmail 1628810 invoked from network); 17 Jun 2025 13:22:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2025 13:22:54 +0200
X-UD-Smtp-Session: l3s3148p1@oOjOu8I3vOsgAwDPXy2/ACpZfVCNKldR
Date: Tue, 17 Jun 2025 13:22:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFFQDlFJXFRYgNAN@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
 <aEwjU-uq4XsNzrOO@shikoro>
 <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWOxBfwwXUpYpmB30Zpqdwgwa2d=hXQyYVsoAD0bN4seQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_042259_489504_9F97341B 
X-CRM114-Status: UNSURE (   5.13  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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
Content-Type: multipart/mixed; boundary="===============3816725137538837753=="
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


--===============3816725137538837753==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O2Q7uDJpF2xSamsp"
Content-Disposition: inline


--O2Q7uDJpF2xSamsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks, much better!

Sadly, my mails still get the "suspicious header" warning :(


--O2Q7uDJpF2xSamsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhRUAoACgkQFA3kzBSg
KbY/0hAAqxtUp1HKj3ttcajGfvAqnnYGkByqkVYRsKoh2N8L1pPnXh+C2oOGG/Lp
r1UbolNPnZZ4Asms7E2AeuSxbcV5Qg0Ovdt1qJdZJyKWj9XwY7blcTJgkfGzEY40
0IoHGxAtyTXB7wa+CXgop1Ei96OkQeNnKr+5IICrsHL2i0Ql5i30uZpBKnDkMep1
QB5paadPrC8kW77HhwQ+BmCjNnrzhVbTAAfiQlMbL8uU+XJA5zHVNpFWBu8Hz4Qn
Ux9fxoFnbcFRUKMdUmZJHjcJUb0zwoGdFjcsY+8pwYY44yM8ck1ILD0WgCCeuNv8
2exsBRkHPiSKYLZx5aZgiel8iBLeuTctfqKUTSkBqNmG1RrX7nLmZ33dhqSN7+vd
zySKU7rxqCCoQCaOkgWaAb+tZXW6HXR2iEFcD896zXTRI5/xv5kKsrf7nx/WGWe0
urFU7RJhKoY0pz2VGf+AfmivueG3qoAvGXVgC0kEW8xuTK5CX/BQFaXTfpphCu24
nW5d1RafZ2thdxRwoUiwcwBRf2tQchqCoxi2ZNfoTM9zKzoBnel1eHUIUIfpPze0
9eq0zSmPfyg2xN7xmTAlN9FtbweDDH82eXyJXUuyaBiiEJG98ij07XYmjX4ttJ+/
RFqwmYmV2O5z0MuatSf56eIj+KC1lTI6gIIhssx8ZMzzmB4hoM4=
=MwTx
-----END PGP SIGNATURE-----

--O2Q7uDJpF2xSamsp--


--===============3816725137538837753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c

--===============3816725137538837753==--

