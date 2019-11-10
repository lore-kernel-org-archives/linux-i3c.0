Return-Path: <SRS0=UzuD=ZC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431C6C43331
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Nov 2019 10:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55EC20869
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Nov 2019 10:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8bJnLtI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55EC20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpXOL2flxcOiKXDUhxT4L0jQXF6tsDygLuk55AcpLSg=; b=C8bJnLtI2mqQZN
	qd/RfkAZxlLy5QnA//q2j91Hl6It9CxbycNlV4mI+BTaojbmepcgeaOKTMnG8ZD40rC/cu6GILUSG
	ajQia9KdVaGeMGiysP3PAOXk24ifsth3xIfW7G5lmbcEPKe3Keu1TfrOz3eYXysRsu9Ns6jChGA1A
	w7Lr6+2OIiTyYN/27jxNQg2/0ZOjRWnnu4pQ/+k1fp5RD4+A9Ys1456qEk9avwxjrTecpcSOXUAaB
	V6ZtlhYX+I5Tbq2TeGwX/linS6MjJNXEP+JtuaAktxRYUG4PVmtF/8E3hA5+n3ujmBfg2Eo0JA97u
	Emfz6Wd62M5x/r18SYxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTkU4-0008Bt-6Z; Sun, 10 Nov 2019 10:30:16 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTkU1-0008BW-5L
 for linux-i3c@lists.infradead.org; Sun, 10 Nov 2019 10:30:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF29228EBD7;
 Sun, 10 Nov 2019 10:30:09 +0000 (GMT)
Date: Sun, 10 Nov 2019 11:30:05 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191110113005.57dcff8e@collabora.com>
In-Reply-To: <20191106093315.GA21952@global.cadence.com>
References: <20191106093315.GA21952@global.cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_023013_337405_CCB5E411 
X-CRM114-Status: GOOD (  12.83  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Vitor.Soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,

On Wed, 6 Nov 2019 10:33:16 +0100
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> Hi Vitor,
> 
> We discussed with Joao in Lyon that you are ready with mastership RFC.
> The question is when do you think you are able to post this proposal.
> Our customer needs that and is pushing hard. I would like also to run all
> the tests in our complex configuration and check how does it work.

If you need this feature, I'd recommend that you lead the discussion
(as you did so far) and post a new version. Maybe try to address some of
the concerns raised by Vitor along the way. I know that you were in
favor of getting back to one of the previous iteration (discussed
during ELCE), so please go ahead and do what you think is the more
appropriate.

As part of this work, I'd like you to look at how mastership handover
is handled in HCI. I'm not asking you to implement an HCI driver, but
having an idea of what would be done in each of the new hooks would be
good (and maybe describing that in the cover letter).

Thanks,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
