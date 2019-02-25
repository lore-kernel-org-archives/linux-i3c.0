Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138BC43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 08:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3B72087C
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 08:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g3p5orKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3B72087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oa4H2aUTB1y2L97MU5Tcmo+7XUrglZSkb7eW6MF++e8=; b=g3p5orKK43tz4d
	C5/r0dDIJmb2yfdwEcfQNV4lCXeCvsHXhqRKcKS7cfy2/6VjtVd+N5zDA4X9tS88e8+qrZfCcdsp9
	y+HiRj8bM+KazCWQPMuHs+uX6HyBSGoB9rtZPJMybJxgzaatodrqid58XEx67JWd1/JUKWrALREjC
	v0UeqGjCMpYqKLl8R7nkASE75UT2uPPFWz6tzZuI7b77PBhTvteTFWmEpL75pvC9lBVd83u/Sn96g
	ZL3h3bUpQIYqtdHawa3hYqv+tc+12e3VeQw5gq7w1o44jWinF+ZcM7JceX+RPpxIhTF7rNZQM3XAn
	D1I+pSwW6jEJnD6MjVDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyByi-0003Bs-RT; Mon, 25 Feb 2019 08:51:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyByg-0003BF-0W
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 08:51:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AAB342803A7;
 Mon, 25 Feb 2019 08:51:08 +0000 (GMT)
Date: Mon, 25 Feb 2019 09:51:05 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 1/4] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190225095105.542956b6@collabora.com>
In-Reply-To: <20190222210901.GA5138@global.cadence.com>
References: <20190218130846.19939-1-pgaj@cadence.com>
 <20190218130846.19939-2-pgaj@cadence.com>
 <20190222163010.44a6b7f2@kernel.org>
 <20190222210901.GA5138@global.cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_005110_186263_10D4668B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 22 Feb 2019 21:09:03 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:


> > > +
> > > +bool i3c_master_owns_bus_locked(struct i3c_master_controller *master)
> > > +{
> > > +	return master->bus.cur_master == master->this;
> > > +}  
> > 
> > If you create the i3c_master_acquire_bus_ownership() helper, you
> > should need i3c_master_owns_bus_locked().  
> 
> Should or shouldn't? :-)

Shouldn't :P.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
