Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63974CA1015
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 19:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FxbIEc6TRJygclfPCmPRdHZn1y4+j5wfBcwPegWC84=; b=sdhrGO98XUlTvw
	67Jo7mX3aCWhRDFsIc2nllCehg/sksti9I9nn+BJRiuOklywreRmg3XYcm2sIxydifS4hXICOEQqP
	3WeZyKUx6UNlqURdP9knbt/Lf9QlnuVPnMykitkU4vvhBDWRUwuo3e3UCyVVRvPhVoTVCsukund65
	yPYnh2+cdTuGV51RTTLj7f9gbZOQx7iZuNySH01ROOgeMvkxQBSWeDNHXsLknwIbKjGI4BBAdnTDV
	v96IuhJOd5voSrH2P3rH1Q+e3wlJRiyAk0aUAUKFTTFoSBfXTrjkIUOJ8H5awCcX97tnGJ4OuI3t3
	HnpLPC2s9H3hxMWqRH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG24-0000000E4nJ-1tao;
	Thu, 04 Sep 2025 19:54:08 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCW9-0000000Cl6Y-2vaf
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 16:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fGXs
	rzt6u8YTKnC/hBZpqHUAVKGxcAQu9zwDNMaiVlo=; b=fwATaZHNVLw5UQDUrrt/
	Vs66TdoJ8AIiN4XiINPlBk6/WdC3Ye80fUOSfLwNnnIZp7G+XlFknHpfUqRYocFC
	ZRqPaAIsAC7XlIwfQwfnK/n+6qci6i/80I1N65Srr72JaD+FlcMN8L822lp6R6Uc
	tUq1fD56DjxXBQTmQi9ySso1HHOdGaserRCikoBL0kmsV1fSwrx4X+ueJA/HAfIl
	rTAuPePQcDgHclAUfcEAO8XoQi6b86E73VrRxIfIPwYiw4vS6vgT85+31+6SSkhR
	ukCuGscr/4q26PzKnyu7lo1Zp2Upivn5l5M2Ch0A+xIQBlMuZc6zv2ArwTUjYvNE
	KA==
Received: (qmail 3727582 invoked from network); 4 Sep 2025 18:08:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 18:08:50 +0200
X-UD-Smtp-Session: l3s3148p1@gcfS7/s9SN8ujnuV
Date: Thu, 4 Sep 2025 18:08:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
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
Message-ID: <aLm5kbgRIcomBo6a@ninjato>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_090858_631687_DFF165BB 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi,

> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.

Cool, has it been tested with devices already?

> -title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface

I suggest "Renesas I3C Bus Interface". The above is not going to scale.

Rest looks good from a glimpse!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
