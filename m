Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F90E6748C
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Oct 2024 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AufqAGnzEoo7ZfFTdfHD+d1EQpXpnSeXOBK2wwr2GWY=; b=gYnaGUPQ1kZDGe
	1ZLTgzL/sn9ELALs75REj7SxPublMayVXYgXC6YHTBXhEYoh9HtAM7TnTYWrOKQRFJRrW1f/oMYro
	mNnZy7KDl7o/j6yvKiHbycYSaKScr3fHZiqA816Wq/ahsUXGt2zyDgiKopOgXLcR2VvuI+hRlVBO4
	Mzk7QRd3rTT7/CO54d/SocyHQZ5AmwWyxvyOLYI4x1xq9Mzv3ftKlCznaxLka9PBAYBsKygSt5h6e
	vXF5XLYSrPto1AfJVNnV5npeM6JGiyTHN1ziBtHhCLA4VR1KyC+yzLRQM3VSvakOQ43VjvOBaOO7s
	PA9bihsH6Z4j+zs+g8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eA6-000000057XF-276j;
	Thu, 31 Oct 2024 23:01:06 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e9C-000000057MZ-0SIi
	for linux-i3c@lists.infradead.org;
	Thu, 31 Oct 2024 23:00:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78ECB20002;
	Thu, 31 Oct 2024 23:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730415607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Amyk2g5wTtTmqNtcbU62wwA6H4Lq3sNSfG33ASGNRc=;
	b=ZCryHkdN8cb5hYGjvyKPClv38iqBmO1Y39BFZYjK4ehNab/NJx3NgVC0k68foFm/w2xvFJ
	1+l+VIxNdboIXyYGCE8cBlnIDo73Yz+e7STeT9Dew6pFOSnuFLOC0M9bxK47UwQxo7Eixz
	QQMvy58UzInYBoJe0mknWRfn/zOAfiMmGwCT4fzvM8pOVWfiHMX9D7GRE+Ucr6RmdbpqJU
	1vFI8IZSU6gGAFfsCZoDEy8wtnuvhopqLV+BaiAJw99bubZ1sN0oQxQMiaeWoBGJSi2iYB
	1BpNtbPQSHNOcM9NsQDzQJcv3C/RQYkfGpd09IKzcGiHcCIMU14EOdM8isydrA==
Date: Fri, 1 Nov 2024 00:00:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, arnd@arndb.de, bbrezillon@kernel.org,
	boris.brezillon@collabora.com, conor.culhane@silvaco.com,
	gregkh@linuxfoundation.org, imx@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com,
	stable@kernel.org
Subject: Re: [PATCH v5 1/1] i3c: master: Remove
 i3c_dev_disable_ibi_locked(olddev) on device hotjoin
Message-ID: <173041558585.2392356.5423028675808780456.b4-ty@bootlin.com>
References: <20241001162232.223724-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001162232.223724-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_160010_344354_8DE48E4E 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, 01 Oct 2024 12:22:32 -0400, Frank Li wrote:
> When a new device hotjoins, a new dynamic address is assigned.
> i3c_master_add_i3c_dev_locked() identifies that the device was previously
> attached to the bus and locates the olddev.
> 
> i3c_master_add_i3c_dev_locked()
> {
>     ...
>     olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>     ...
>     if (olddev) {
>         ...
>         i3c_dev_disable_ibi_locked(olddev);
>         ^^^^^^
>         The olddev should not receive any commands on the i3c bus as it
>         does not exist and has been assigned a new address. This will
>         result in NACK or timeout. So remove it.
>     }
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
      https://git.kernel.org/abelloni/c/36faa04ce3d9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
