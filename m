Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B061C77B7C
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Jul 2025 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5qbfiW/vAHyeZxJoIDtEYaQF99jYYx7+fvsJqmDESY=; b=TIoWYSTU44akEa
	IscmfzYhTJEVeeLFXyyuinzvhfBHbU68XpfpHDVBzk+7QJf5h5L1clEuyqL4GkMvbbbHlWY2gtvf7
	/2Mnx6LQo6ImNY2Ew1q8iBbvpwVXN2n5UqJV7m26bMKdlgelX0FvciRpW1xTL+16uINqjLdz0TqTj
	ALjoa+T1SZwDh7dyWkKTaBCVJyflM+vPK2eQ4Umb7We9ixnRAEU8oqWpCL8/Jm69C6OV+LXII26le
	XpCn1XZqw9OT1XPvqtjz/NdDYSfOMP+73QEFt0cS4gj5GgQviJNxtbf2Lwu4knqmmgE+0LRMBK1XL
	PFB9s/dg1q/niinr3GwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXED2-0000000AUQx-0o5a;
	Thu, 03 Jul 2025 07:18:16 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXECz-0000000AUQN-3ojF
	for linux-i3c@lists.infradead.org;
	Thu, 03 Jul 2025 07:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YoGB
	mC4R1su2gB7oaxjTFaEPBQ9RE/7hlEOYR31rees=; b=LGrtT5q+y5h8Nv2ZwMUu
	SFwhMYl7oTQP8+BuSJRMuI6kjhtoEhcXdwNczHcT6ZRvCNFXU3wrsfBfi5Pw556Q
	Yb+wejME7aRqSodfZT+FsoWsi7Zqsa5ZdUZW7Vb6vVosOYKMsgw1vSb6YKv2nGhb
	OzpaChOEqhfRFTsWxTrj4Tkh5OTiwC1Ses1NRbNt5kYwvxlWuG8AE9Z0F7C/thOQ
	PLWRLLOOzdTveqM1RQe7XBv6yKToNQ78jufJqjGwG/WxZG4meOCFDgf3jVu5nKhw
	BGirVeNSKGhDIDFd43LQGmhtr0+8flOpwFKUCkGKTEwzDSCIXgWkTo1fyiIaiocj
	1Q==
Received: (qmail 3767328 invoked from network); 3 Jul 2025 09:18:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2025 09:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@NEoeLgE5fMAgAwDPXyUmAP5FmBXRrw7R
Date: Thu, 3 Jul 2025 09:18:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aGYus1HSIkSK9mRm@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
 <20250625200709.GA2125481-robh@kernel.org>
 <aGLo1mlrHT_IZHQv@shikoro>
 <bedabd80-ba9e-4f70-9f75-655ce90d2b8b@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bedabd80-ba9e-4f70-9f75-655ce90d2b8b@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_001814_221411_9A379B59 
X-CRM114-Status: UNSURE (   4.55  )
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


...

>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g047-i3c
>     then:
>       properties:
>         clocks:
>           minItems: 3
>         clock-names:
>           minItems: 3
>         interrupts:
>           maxItems: 16
>         interrupt-names:
>           maxItems: 16
> 
> Right?
> Please correct me if I'm missing somenthing.

LGTM. I will send it out like this in the v1 version.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
