Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA18C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ez8Qep06WqWCN90KOhS2DTjjmtxHMA4Vjoy2Mk1OBDk=; b=Ea10paFryM+KFK
	6TLj8AMHVRNgwgpiVeglsbrp4JwDyJEsn1ZwlqsjkTsUNBPPKVZSfZ+vyeCCUQOwDe/J56PeZiOe7
	Hw3Im7xzfJagh7DP8ny/pR4Ti9dceEBsrwjANzwt81kLZiJ2grrGjk07/c6dekRr8Utgk7DE7Qims
	vL9bV81f8v0ukKZzp3MxZNr8zTB3WCZoFJiagnu8iKfz3TtXt47lkm/FfGre1mVZhkt6Boer6q/Ri
	zqwYX/EhYwdLwWw2R9IyFHOB3v8CrjfDQ7shXM5HV4GLwHGQ5cl8c6EDPG+LP6TQsBPjPAu7g7SEK
	mwVeodshmJq6q3LsVRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8GW-00000001nOm-1GO8;
	Wed, 30 Jul 2025 14:58:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8C4-00000001n06-1h1W
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 14:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ie+R
	IG1rJYm4GmXC8JjeZKFDJPovwpXR3vjbC4sifHU=; b=k3/IZMwHuOeVahgnAUu3
	vKGJIsEkUiEf2hNu18PmR2tKdfNsrxv1TcfC/S69NHlxnqJvQo5If+rPkfAaloRJ
	8172ZavzDWHQ0k4uKjZ8xIAV8wCem4OvcEtcSwqaKL2oUpfwDmYUQKaXb6M7noGE
	lTiDjcE1xynJGkZ31TNCfeUnyCZjIgtaFrZ4T7bKch6YzoT+Q0yYXDj4O7uAdyzj
	+spw4hAnmtm+POL/tA0fc08wRD2rwb/Yio59fyX+WbzLI9NHEenPQBb0vVAYx7zd
	Jvc7FbKdKjFzgJbHG5yibH4TS8OZIXd0J/ZLIq49LWD+RBuXMT1xUoWvzD9Zb5Cp
	FA==
Received: (qmail 19156 invoked from network); 30 Jul 2025 16:54:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2025 16:54:09 +0200
X-UD-Smtp-Session: l3s3148p1@M+RwsiY79lBtKPC7
Date: Wed, 30 Jul 2025 16:54:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 4/4] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aIoyEKpB7twvKDGN@shikoro>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
 <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_075413_323620_65D1D0A2 
X-CRM114-Status: UNSURE (   7.01  )
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


> Why not use readl() and writel() directly?
> To make it easier to add debug prints during initial development?

Yes. And ultimately, there is a patch in the works converting the driver
to MMIO regmap to get rid of _all_ the helpers. I couldn't make this in
time for the 6.17 mergewindow, though, because of... gory details.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
