Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D0EC4707B
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jan 2024 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhl0tjwIod3DlfG69BPKlobvmNCogux/ldtSbwsuaRg=; b=HcrimiShiPRgjh
	InCPFGYO331KUVoKMTDVCI61SqBxBsB2kRWhgAB2FRoGYg+UqpMIH7lejrK5e7N6k3vmxIwMcgTcQ
	eo6N2P8kBHMoyG01z7IspE3IqD0vT68zoqiG1t1LMjiB+pXI/wHUruxWz9Ki+2Ci7ihMmjrMkQPgj
	hYZbos5GkeXyKXONTy1wgz0W7figc+S6H8725ahGSM4NARuBJs0iIrINcrMaIZl6PM/uTxI23fEi/
	DH794qWb4uGVD2tKrF4g7kORYulcBgbNMdi1uILJq8NKlseKIKfpsb3HpheXeRNjSJW1xNVqjFbx2
	y2I8TSd6t0cpAbQCBo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP8Xp-007PSq-0D;
	Sun, 14 Jan 2024 22:01:29 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP8Xk-007PSL-25
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jan 2024 22:01:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D777D240005;
	Sun, 14 Jan 2024 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705269678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fLX61tzEOONDeqXZbwPqPkiVxXM5Uzlbz5ndGUIocoQ=;
	b=H4KePbSnAwwqEwgms60WfsfX/enwL/ZsFhU1TzKFat5y8jK7qS4WXBfKxlbVcri3MzXCuy
	I0EtI1mlv9wKpiogZwSca+Hd650+mPDn5SMoVQ9HNJntnQaPMRayrCiOwz2S2e4RUPDeMO
	sTHcx5yvTZ8OxiH/mWmzbSCXaz3xwmXrRvT5CIwQVBD/7SDeFe9XmWhaUoz3lKB2eVoamJ
	LNl7OsdnmOzqKbb5WN1hg/ZTc7KCJ9gJK0906uqwwSOrESNgXcNSet2CeTs48bt07CcGzB
	4Cfe0cqC2BKcbrvi1SEXx5bE+5Fr71LALq4Umf7dpAu9r8HG5rDkmTiayNED/A==
Date: Sun, 14 Jan 2024 23:01:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, miquel.raynal@bootlin.com,
	zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH 1/1] i3c: master: fix kernel-doc check warning
Message-ID: <170526966419.132104.16421522756739565942.b4-ty@bootlin.com>
References: <20240109052548.2128133-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109052548.2128133-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_140125_008984_F8B9E497 
X-CRM114-Status: UNSURE (   4.97  )
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


On Tue, 09 Jan 2024 00:25:48 -0500, Frank Li wrote:
> Fix warning found by
> 	'scripts/kernel-doc -v -none include/linux/i3c/master.h'
> 
> include/linux/i3c/master.h:457: warning: Function parameter or member 'enable_hotjoin' not described in 'i3c_master_controller_ops'
> include/linux/i3c/master.h:457: warning: Function parameter or member 'disable_hotjoin' not described in 'i3c_master_controller_ops'
> include/linux/i3c/master.h:499: warning: Function parameter or member 'hotjoin' not described in 'i3c_master_controller'
> 
> [...]

Applied, thanks!

[1/1] i3c: master: fix kernel-doc check warning
      commit: 34d946b723b53488ab39d8ac540ddf9db255317a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
