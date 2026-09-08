Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B73BC79F82
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Sep 2026 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyIjhgpOxMouIp5bz3A8dLN5UrQ2S421MqQCFwBWUu4=; b=nvLLgDr160bvqM
	uAeWVYL1Nk3Cf8b8hY+ep2qxcE96gzoG4vbVgSYCTvSKOk4TVlbn4dCD39+y82DH3BXvPm+vu8MdX
	+SZ8rme2HPZSvf4Sj5/j43bBjCJMLD6vn0N9Pz6SpTyq5RY4UOFdvMDvAyJXtEhFrwjmSx/CT8yRf
	zWNdkudSgm/4IoJssqv89l8setPqJu35DgR7F5rc1WvEiqOWwWJvnjqkg/wdAOsbCkpK9wuBg+ZSA
	h8iwvTFdd04ZrgbmKjoHKGoX8JsEeMlEKr/DuKwNKbODY5KLxAxxijCYI8ZFwSrdRMMLlRBHocnpt
	DJJoR201gQAHtbtrcNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uJI-00000008vd3-1CyT;
	Tue, 08 Sep 2026 11:48:20 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uJD-00000008vZ7-2HWv
	for linux-i3c@lists.infradead.org;
	Tue, 08 Sep 2026 11:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GwAM
	4gowDitwIjNJMy5rgCy3NbR/ZVKB11i5G+hXKo0=; b=VKM/Ny0sp0jwbctOVNNR
	LJ2QK/N5K//n4QfrObA+Uwbz445zQmBNbjBrbmLJmo5hgV1uJzaBTlNMqfOn4aJK
	HUKUdWlZVKHx1OLVZqyORGJroOpnX6h7YVswxP1UKS8ZNPpO6SRRu/AdzIyYbSTj
	xogWf0dSRxe65CpwiRC7BJi94y5ZaYesxgs3YaSENlVl0C5pKPzHieIewCpp+5YB
	kCA88uDg+Rso3ZREh81BiCjuQcRajKMhik1a+bnkPojzJRjNJkQo1jr1BIZlqmBj
	TWWr2UJhcFaz5FCjLMvr2Os+lz8/je1Ri6Sjo1geUlkNmO+lGlCmRD+W7fXYfJWE
	fg==
Received: (qmail 2754733 invoked from network); 8 Sep 2026 13:48:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2026 13:48:10 +0200
X-UD-Smtp-Session: l3s3148p1@ICQTT/daxsAujnsK
Date: Tue, 8 Sep 2026 13:48:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] i3c: Introduce i3c device userspace interface
Message-ID: <ap_1-gFF7S821xJT@ninjato>
References: <20260906202747.4041389-1-samagazaryan@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_044816_930331_F3E066E6 
X-CRM114-Status: UNSURE (   8.90  )
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


> - Fixed device lifecycle and concurrency:
>   * Switched to cdev_device_add() and cdev_device_del() with an embedded
>     struct device and a release callback, preventing use-after-free and
>     races on driver unbind/detach (incorporating fix from Oleksandr
>     Shulzhenko).
>   * Cleared i3cdev->i3c under xfer_lock on detach so concurrent/subsequent
>     file operations safely return -ENODEV.

I haven't looked at the code (and won't have the time to do so), but if
the above paragraph had not been present, I would have nacked the series
right away. To say it positive: Kudos for working on these issues!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
