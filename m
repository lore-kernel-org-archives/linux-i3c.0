Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A6606A32C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIwTS6xu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=il56kfT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XuO0bYa4eWolTiFSly+Rzp0O3NJyR9lg1LxMCTpD344=; b=OIwTS6xu/PzjHUsZsO5AeFLQq7
	u+q3Gra+5KywfleuByDfySzZrSnhRmIOYcjyK1d3KMmvtSuwfoRDGqZtSqXLJ46G9/gXBriyLz5kM
	2h5F/Wcu4OpIQk0SxjglBCz4OjYmDU08xHCfeYyMhEtV3iFzyTBfYOiHDVCQKJYd+FAj7O5r4YFSD
	b6BZ8WiEFC8KvVowMcMXbbR1TqHT2mJEUnWysXMmPS6HCQQ1oJvqzJZeJNYtl/UOSDr8p9oHjXErM
	0X92SaRNrS7qj2BxZubkU9nW7F4zq8okY65nlZ3An6SrXy55h9zqfe29fbyUlLkjI6Sqnwd229yFZ
	Y0jrhjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCVF-0000000G9vp-3GC6;
	Fri, 23 Oct 2026 10:28:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCVC-0000000G9vF-2NDy
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 10:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=35J4
	5cG94OOD62+cdK1/ryqr1JaqXdQG3Tn3ixfFouQ=; b=il56kfT7Z7Dm3ew7sjn1
	h+k3m7Bvl5HLq/Qj1yHbnt4E5ALQYYVxdBFRohyxRS9meJTAUc/ldl+VE/TINNZ/
	D8pcvxN8RDdDVyL/uxbvPUvU0BJ5H16PXwPxHl5+YmZWLJVqc7la9aNGCb7pVxav
	mHThwnPAw/YMu9Ac36wfk0xlKZLpMxFsbne5VB228SLG4MaiXe3VJe2IaRbnEm3b
	yXVsDfbb/KDSKLd4GO/Rp9/VvzXPllWsUWn33gSdgPZLEgx+4NyeSfxy/HcZCV7x
	+jNzOPSplrNT5oX2lO3SiukLs8559RXedErqHiQ4VQevSFdRn9PJCYKLbMUoVy/C
	vg==
Received: (qmail 1512198 invoked from network); 23 Oct 2026 12:27:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:27:56 +0200
X-UD-Smtp-Session: l3s3148p1@Rbb2bn9ewNgujnv2
Date: Fri, 23 Oct 2026 12:27:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: renesas: Drop comma after OF match table
 sentinel
Message-ID: <ats2qwNekJgw5nbi@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_032758_897364_A7241E15 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:14:56AM +0100, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
