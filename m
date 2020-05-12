Return-Path: <SRS0=ChKo=62=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF33C54E4B
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2020 07:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BB1206B7
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2020 07:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Izw/GkhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67BB1206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbMUtbXUqfnJIyi5AqBbAMQtTu6fcAZ5wxvHA/jlWjo=; b=Izw/GkhY8I0ZC7
	VgR2l9kx6DuKeSdKe7yM/BGH5YCGfP57D2rC90PF13BlrrRbYu/Lv7+WPhZlr95WGe4SkKybnyi1c
	oQfswuOCXW/4j99M//squuZBa7jESzQKg7iU/zDC8CA8/Wq3132k4LrM6Yhv+74yTJ29giuakvHeA
	0PofiFi1w9FkTWjuV3ZyOprJBZ/SnRYoKR6JDaqzJZA6SzXcvxF0hieL1ABx0aBy7HE70nXc/7sbi
	DCv0rjm8oVZfk+SG/vss8Xau3Dc3fym0sSlTFvF8OmfOlJlEkKQ6ZHWkvSuy8pgvDy0ePwM5iNgsm
	adeRl5TQB18Ed7SIJHxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPT7-0001ny-Td; Tue, 12 May 2020 07:36:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPSL-00011N-0W
 for linux-i3c@lists.infradead.org; Tue, 12 May 2020 07:36:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0E4AC2A0A56;
 Tue, 12 May 2020 08:35:52 +0100 (BST)
Date: Tue, 12 May 2020 09:35:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Raju Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v7 1/7] i3c: master: secondary master initialization
 document
Message-ID: <20200512093531.6c348b8e@collabora.com>
In-Reply-To: <DM5PR07MB3196C4B887D5D4720971BF11C1BE0@DM5PR07MB3196.namprd07.prod.outlook.com>
References: <1589202702-4879-1-git-send-email-pthombar@cadence.com>
 <1589202759-5677-1-git-send-email-pthombar@cadence.com>
 <20200511180500.6e1c4453@collabora.com>
 <DM5PR07MB3196C4B887D5D4720971BF11C1BE0@DM5PR07MB3196.namprd07.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_003601_199876_E69087EC 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: Milind Parab <mparab@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "praneeth@ti.com" <praneeth@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 Przemyslaw Gaj <pgaj@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 12 May 2020 05:03:32 +0000
Parshuram Raju Thombare <pthombar@cadence.com> wrote:

> >> Document describing secondary master initialization,
> >> mastership handover and DEFSLVS handling processes.  
> >
> >Thanks for doing that, but you probably didn't try to compile the doc
> >(the formatting is all messed up).
> >
> ># make htmldocs  
> 
> Yes, it looks messed in email but I built html format of doc and formatting was ok.

I did build the html doc and it's not ok here.

> May be because some tab/space issue it is looking  messed up in email.

No, it's really the html output I'm complaining about.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
