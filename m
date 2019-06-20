Return-Path: <SRS0=tkUc=UT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DBCC4646C
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Jun 2019 08:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8A82084A
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Jun 2019 08:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EiIpmv7S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8A82084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+OXPNPeVcIQWZlcEH+eksKLh/jajmIqI+DQxq7uDww=; b=EiIpmv7S4TCLne
	WUrb7qVerxD/s/i1JXFN1aK5Ucg4xZSRW0ysQGVcsjMNaHwacA7n7OEl8IjT2FFj/skKZk6SOgtXv
	McHk60czzvwp75i081jGbfo7o5g+0Hqsf38odg56kaCrYouDcPHamPFDVyNb66WJBbFzhNmbmkLmI
	Pk3WjpW1cz+SbDoZV+UMqpqWNv4PqBT+Skz9HFgNi6jyaZgbhzcMvW/6om5l4hU1rEQ4HWO5lydZ4
	+OqR7XRyUV44kxnZworHxY/DytQswuYU72F+IR5X+nJF4Y/cjzfa7hPpWJmwXTtMd/HHcTvXBXvY9
	itlw0pnPJLAvcTDxZCzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdsro-00010j-SN; Thu, 20 Jun 2019 08:56:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdsrY-0000pV-QY
 for linux-i3c@lists.infradead.org; Thu, 20 Jun 2019 08:56:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7ED44260D60;
 Thu, 20 Jun 2019 09:56:05 +0100 (BST)
Date: Thu, 20 Jun 2019 10:56:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 0/3] Fix i2c and i3c scl rate according bus mode
Message-ID: <20190620105602.28b538ae@collabora.com>
In-Reply-To: <cover.1560968688.git.vitor.soares@synopsys.com>
References: <cover.1560968688.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_015609_051302_C0F01F7F 
X-CRM114-Status: GOOD (  11.02  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Joao.Pinto@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jun 2019 20:36:30 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> This patch series fix the i2c and i3c scl rate according the bus mode
> and LVR register. It also introduce the mixed limited bus for the
> cases where i2c devices doesn't have 50 ns filter but allow higher
> clock rate for i3c transfers.
> Please refer table 5 and 10 of i3c bus spec v1.0 for more detail.
> 
> Please follow each patch commit message for more details and changes
> made in this version.
> 
> Vitor Soares (3):
>   i3c: fix i2c and i3c scl rate by bus mode
>   i3c: add mixed limited bus mode
>   i3c: dw: add limited bus mode support

Queued to i3c/next.

Thanks,

Boris

> 
>  drivers/i3c/master.c               | 57 +++++++++++++++++++++++++++++---------
>  drivers/i3c/master/dw-i3c-master.c |  1 +
>  include/linux/i3c/master.h         |  5 ++++
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
