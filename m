Return-Path: <SRS0=AFd6=JV=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32626C433B4
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:26:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E426128B
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Apr 2021 20:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E426128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XwuHvqwan5nBm/39XgmLuXJUZCH/nploFtxhbCizZTc=; b=ngi/TBffjYx/vkOLwr2aNZF7W
	bU1oEtm0enGOIhfJTAe9spOeBFXV+yBGrZOYGVhc/UVH5llTs/2oR4gFYLFVX1AVY+9cep6VdZXPJ
	w0di/vSsTIHsSecTosGcPGsy5VoMTumsJ/9Ul1xulvyGypAE2ahscyheM987FTEgK4x7f+fDnpWYJ
	Fe6AxfJDwo9Uce2J4KWR+dzzoXgGAUBvVgFgvbL2cJ4KbbXJO+nyYgiAcQ0x5FCvWdJQ2p4++HxBM
	4ZuUyK1/nEABLwyrad+YFU74Xe2vAe6yXJIHkQYiEupPyp5iaCdO/x2rjg9hDPkt+6ip3X/qNfwLP
	tey5ZM5Xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laOqs-004OJe-Cn; Sat, 24 Apr 2021 20:26:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laOqp-004OJP-KH
 for linux-i3c@desiato.infradead.org; Sat, 24 Apr 2021 20:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=SzsQ9tF5ta78OgEtoP9sF1RN8t2Bhs3cCqln6LBrAjY=; b=eD4kqwghLn4t//DmGRDVrjc5xc
 POO0xBBsQgxSj4EAQxUpje3xD9mU/SBrcA36lZPzhN/SDLkjTZMNxPrYnxqY74JbAqGekCTBDoyJg
 NKrqLGd7iZ5rpLs3yknebDsvz2BAd+shqGKpSU319veSqAJb0VlfK2JdDaaBLyufONjka6QC05PpD
 lG7Ru7U6wCgt9i8q2vsvifeozjQJnvU84u8ilurSph1DolvVJvjyMs9TF0ywv4ccF6Djlc0lgiHQQ
 yua+eJyUSOQBB609POk2JeWUeGObT1tZzA5DVCouLkltYTH314BgY1fy8uDlcXhFqRBFxqE+URq3W
 i3a6Dt3g==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laOqm-00F9Hm-Kz
 for linux-i3c@lists.infradead.org; Sat, 24 Apr 2021 20:26:02 +0000
X-Originating-IP: 176.177.118.122
Received: from localhost (unknown [176.177.118.122])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 57191C0005;
 Sat, 24 Apr 2021 20:25:55 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qinglang Miao <miaoqinglang@huawei.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [RESEND PATCH] Revert "i3c master: fix missing
 destroy_workqueue() on error in i3c_master_register"
Date: Sat, 24 Apr 2021 22:25:41 +0200
Message-Id: <161929592285.189809.16598700064500451755.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408172803.24599-1-jae.hyun.yoo@linux.intel.com>
References: <20210408172803.24599-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_132600_850384_0FF5CBA4 
X-CRM114-Status: UNSURE (   6.77  )
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

On Thu, 8 Apr 2021 10:28:03 -0700, Jae Hyun Yoo wrote:
> Adding the destroy_workqueue call in i3c_master_register introduced below
> kernel warning because it makes duplicate destroy_workqueue calls when
> i3c_master_register fails after allocating the workqueue. The workqueue will
> be destroyed by i3c_masterdev_release which is called by put_device at the
> end of the i3c_master_register function eventually in failure cases so the
> workqueue doesn't need to be destroyed in i3c_master_register.
> 
> [...]

Applied, thanks!

[1/1] Revert "i3c master: fix missing destroy_workqueue() on error in i3c_master_register"
      commit: 0d95f41ebde40d552bb4fea64b1d618607915fd6

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
