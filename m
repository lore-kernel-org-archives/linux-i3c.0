Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D08CAC580
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYc5xbXP0JH3dHkoH0wgtP4vG9Al9916q9bip39qsdY=; b=u5qkzf6zpcM8Rx
	tjP2lq+Aaxt50jgRI0wKkFmn49gm+kw5TKauVOH0r1p/Q/q8XiPWsJYRaUVxEXrZ38hXZqn1pTL6H
	dkBmjrtLLO5GwnPlDUm1XjMsyxHSMEj7Y8z7UGU5+s6/Fc8CGILcyCanGdIycJGyD6/6Bn0Y8XGzU
	39s4SrwBbi+lubmUKyy/HO5ym4hUzWo53HFhIBI8MhTAb2f8c6uN4tP3/E56BoDRjNn37tXkNAMhK
	20KtpSnx3nPFospjkQLrRWP50ZzRglrR/E1zdQI8boa6mWnMbbwbrXhXdwltutqJl9ygB549W0pmc
	cKFu1TQBGPhJdi+w++Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZU-00000002Pkq-3Sxg;
	Fri, 05 Sep 2025 14:37:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUQW-00000001JqR-19w8
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zVWE
	ldUDLWXndlkuAPr07pm2azCdz/l59iuF+leqIYs=; b=Az302rKeRwRyNr72awQg
	TlQq3AF47qfdya83T1YdQG1z9ouFaKMVUItbvI6Mz29NLN8qu1PU+bIijnKsVufB
	cHsEB43Qrk+cvXhiwbr/q44d33Kg9pTr9eHDoobfG6rFtNOLOHgNvP3Fk3dhZDGs
	74zwjAnYFKPTIGzUnaw/FKpw+TVCMcECtojnZNmgmm8XyuIlSP2Otsro+ySaP7WT
	XaZXPv7jCRK3HfPHMBqzYrL1XSf2OWeVEh0Z87VKkMbvCOGUj3Q5x9lBfbvdiLbO
	GRddJoK+lNXHBrQ3iMkxZUZHW28gOelkKOr1gSHAKRl56vVA9y4RG9F5naQ0SMbI
	/g==
Received: (qmail 4018941 invoked from network); 5 Sep 2025 13:16:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 13:16:11 +0200
X-UD-Smtp-Session: l3s3148p1@Ye0P9ws+as0gAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 13:16:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLrGehz-3FA4qO3C@shikoro>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato>
 <aLrF1OnctYZwy15y@tom-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLrF1OnctYZwy15y@tom-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_041621_166914_8D465362 
X-CRM114-Status: UNSURE (   4.82  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


> Maybe "Renesas RZ I3C Bus Interface"
> 
> ?

It is on R-Car Gen5 as well, so... no :)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
