Return-Path: <SRS0=cSKn=QE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA79C282C8
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 11:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CADD21738
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 11:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tqqezEhe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iYfpD43y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CADD21738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DuU3tjYb0TNDVU7DO0H/uDDZP377KhO6Iqbm1ZMSxkU=; b=tqqezEhe45FCPt
	YZyH3cGiKdBqHlhLwKHQjp7SagrtyCu/5tozvB+rO6RyNDsIi6I2hbh+RsoKCR9GLGhGFp9v56QeU
	5jV069WmHkrf0/a45XJZR8EcRXw8GFg3coryBgPyfh9IDN/v54kBtgsmIbCCjLA9O0ylXzxeVO61E
	IUQApHwgiIPQwR4jQLELZivi7EXY7x5wnuXrxJbzcl7vcvdVeHcYA+Fky2xtF3QoGpJMiwCV+IoSo
	vQDnxnWOsR1fTnqKrFMZHjI0dg8KLIbP9KlQ1jSTpujBuPldgUIdJCw8d+jVZMFyb3QT3X2c3zEGp
	Kjr8C+6dqUUNlXVTslYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go5DO-00018u-6H; Mon, 28 Jan 2019 11:36:34 +0000
Received: from smtprelay4.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go5DL-00018U-Vi
 for linux-i3c@lists.infradead.org; Mon, 28 Jan 2019 11:36:33 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id C570424E25C3;
 Mon, 28 Jan 2019 03:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1548675389; bh=gfxZzYugKWXEmyC5HsJRpv68d+H7AMhcM0g3rfi1rqo=;
 h=To:From:Subject:Date:From;
 b=iYfpD43yFERnpVsE4LjgT7/yk3jONiDc+IZBE4JwwYp+hMQDd9D2+0aL9DdvVM5lV
 Uop0Lm+m6KFtcBBM9GXEF8ON2cKFrxKn2NZ1l12Tln4raIAbajgdo8mdxWKUpzMw1B
 dMSr6ZHLpgToOKMR5FolBcCUUp6xOh87HLyz5aVuJ5MA8H00wHNLYnucHORzyGBN9t
 TCt8vN+cBv6+bxAKl1yJt+7zj/vWW88sQKincCLXc4tcT0+MRCyM30/Dm7l22YAkA4
 qlmvViCdRDevSoFn6xNZst3LxwpfC/oEuElU9DgkeeuC0YdPZ/1W1RoOVuV27Xvhnl
 y5ChhJTtxlI4Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4C7DDA0073;
 Mon, 28 Jan 2019 11:36:28 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 28 Jan 2019 03:35:42 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 28 Jan 2019 12:35:40 +0100
Received: from [10.0.2.15] (10.107.19.126) by DE02WEHTCA.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 28 Jan 2019 12:35:39 +0100
To: Boris Brezillon <bbrezillon@kernel.org>, linux-i3c
 <linux-i3c@lists.infradead.org>
From: vitor <vitor.soares@synopsys.com>
Subject: I3C Tree - Development flow
Message-ID: <12d083d6-3973-0d07-ccc9-c28c2ae1aa81@synopsys.com>
Date: Mon, 28 Jan 2019 11:35:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.107.19.126]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_033632_030885_E5FAAAB4 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

I'm not understanding the development flow.
I see the fixes going to fixes and master branches but not to next.

I was expecting that next has the most recent fixes/new features
which it isn't the case. Any advice?


Thanks and best regards,
Vitor Soares





_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
