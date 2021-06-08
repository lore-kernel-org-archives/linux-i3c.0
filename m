Return-Path: <SRS0=ob38=LC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3636CC47082
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Jun 2021 23:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BE761184
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Jun 2021 23:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BE761184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeCPkTHvAy+yrjLbqsP2SY6TiWmJgX3Xk/XOOGtXWaI=; b=kkvzFoLiJg/vMo
	Pcy0NpdSlSA2hcyfgOdCarrG0zyTRNVbpwPFt6zc780O31/FKUjTF2sq66jzl3mS6dEFxwSZ0jXvf
	9kid6tq9lHyBEMxulEU1jgDZhSVcSGziTjWP+aJ2B/4Pd9fwtW4vv5CB/zP4GhszplmI0VokzLRrK
	Fz4M+xSH6RUCmzSjsEpnTVE5VQdR4iweNt2mYMm+aSTtPjiQj86ClU1zGFTyjr/o0jPCUImyZoOYz
	uoawbDLeRoqGgoR6dtVWfbrbzSFUQO1sclk4Lcru2acddK4GS+D2ys/4P/Y0Vvm0H9CkWelKTTi0x
	yUQaX44ypjGbBMGeq0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lql1y-00Al8i-3c; Tue, 08 Jun 2021 23:21:10 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lql1s-00Al83-M8
 for linux-i3c@lists.infradead.org; Tue, 08 Jun 2021 23:21:08 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1341D1BF204;
 Tue,  8 Jun 2021 23:21:00 +0000 (UTC)
Date: Wed, 9 Jun 2021 01:21:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Parshuram Raju Thombare <pthombar@cadence.com>
Cc: Nicolas Pitre <nico@fluxnic.net>,
 "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 "praneeth@ti.com" <praneeth@ti.com>, Milind Parab <mparab@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/7] i3c: master: use i3c_master_register only for
 main master
Message-ID: <YL/7XP1fs/2bRiTM@piout.net>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717066-3785-1-git-send-email-pthombar@cadence.com>
 <2s3n7419-1nr9-8885-882o-7qrsos6qq6q@syhkavp.arg>
 <DM5PR07MB319618AFCB415501CD33741FC1CD0@DM5PR07MB3196.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM5PR07MB319618AFCB415501CD33741FC1CD0@DM5PR07MB3196.namprd07.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_162104_881710_345B4B02 
X-CRM114-Status: GOOD (  10.28  )
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

On 08/12/2020 05:47:51+0000, Parshuram Raju Thombare wrote:
> >This looks a bit confusing. Here you're rolling back detailss in
> >i3c_primary_master_register() that were factored out in
> >i3c_master_init(). If i3c_master_init() is successful, then you
> >shouldn't be undoing its things openly in i3c_primary_master_register().
> >Instead, there should be another function that does the reverse of
> >i3c_master_init() here.
> 
> Every function do its cleanup in case of failures.
> And if any failure occur after successful i3c_master_init(), we have
> function i3c_master_bus_cleanup() which does the major cleanup.
> 

The point from Nicolas here was that the workqueue is allocated in
i3c_master_init so you should have a function to destroy it instead of
having to do that separately in i3c_primary_master_register. The same is
true for the put_device. Or you have to ensure i3c_masterdev_release
is called when i3c_primary_master_register fails.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
