Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC834C433ED
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:19:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F08861284
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F08861284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=smDaj6i2HZSoRk7EMoItn+eW2k1VHnsjr26jhP5Sxl0=; b=gF/VQqF8XijbqOay6N27GWfr+
	m9o247IHA6Rr+88BqwEb0SNUD9QjMdF6VTSsbtfq72WqYyJ4dvsRS1zUr73JPCZtbktGWO171yWAv
	u2cLxKW7uA6a4aDAwq5uADbOrW17MmG2yQjZj+0x26LZc0YfTQOkboYjNGWP87U9KrBYTuJuoT5Di
	/D+NkmXwLG/FRek4/usGN/M2fxUgeA7l4PwxPlVhpkpfTwGh6ppqVsI4XIrBkdndVtX9haffgGyWR
	4uiJMACUTbtPRGDB/4RGy97ZhFWgazG+qEkqVqZjdnzC/NmRGXKgRbr9SQuREa9ep/YMuwd6J2ZEi
	Z+Ki1F+vA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOku-004NNi-NQ; Sat, 24 Apr 2021 20:19:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laOks-004NMY-Vr
 for linux-i3c@desiato.infradead.org; Sat, 24 Apr 2021 20:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tW1gXRhLBw+gvp9g//yOI+zt3EQX4GNLQK8bWCX/db4=; b=OY8dRMNe2XBZ/zyPq/dX8DJiCz
 e3ah6xbSST+XFlm2gEaoKec6PHDFx8uRKe6ncnouJLHoBmJJqaCXfoLzK0Pjn0IDt3xvmVK41ElcI
 5dKwaQaUZ+xgvHwtIBXS/Ow8L5dpV1BTXg5OS/bTrC5+CDhJdFNSaNHCHlvyLRU3RL9+biKBNYw6V
 H7YZyMNshSL74KSHQXGbJwF1+xKCD+y1nnFsrn/F3miqkOes9hGk4KbaSHDNx7HO/qFeyjDmw8dvR
 A+j82RpD+hBckWgK1zHYyC9IebmIVs128+I+i2uocB8p1GidqMjN0WWnyP/SuZ+KoNVhvaszD5ten
 3ysKYaxQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laOko-00F9CB-Rn
 for linux-i3c@lists.infradead.org; Sat, 24 Apr 2021 20:19:52 +0000
Received: from localhost (unknown [176.177.118.122])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CFE1C200004;
 Sat, 24 Apr 2021 20:19:43 +0000 (UTC)
Date: Sat, 24 Apr 2021 22:19:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: zlukwins <zbigniew.lukwinski@linux.intel.com>
Cc: linux-i3c@lists.infradead.org
Subject: Re: I3C Slave subsystem
Message-ID: <YIR9XvDM/RFrlAoq@piout.net>
References: <a97b4b6a-d9d1-c692-849e-c7eee3444fdf@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a97b4b6a-d9d1-c692-849e-c7eee3444fdf@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_131951_055184_7DC251EF 
X-CRM114-Status: UNSURE (   7.81  )
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

Hello,

On 06/04/2021 21:59:47+0200, zlukwins wrote:
> Is there any plan for I3C slave subsystem/framework implementation in
> upstream?
> 
> Does any one work on this maybe?
> 

There are no concrete plan but I've seen some demand. I guess the main
issue is time and funding.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
