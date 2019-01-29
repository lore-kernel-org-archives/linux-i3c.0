Return-Path: <SRS0=ixSD=QF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A0C282CD
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 00:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA71B20870
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Jan 2019 00:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FkaDnFM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA71B20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jvSKmLk35lPcHfmPjiNwcN+tG2cab4HPlO3gNZRidR4=; b=FkaDnFM2E6AS2a
	sJInvi6VHdcNlMjwRHYFprnvIDL5rZqAkXxMsMCVlntpQpixVSplqRfyLPpQYw5/oL4gy5c3ub49F
	3igu5x/eWUYXDPoEZiXZyRVBAlU+AJEAPDKewKKZOCXzCs9A0kowUnBdhkKM6m34cqShiZHROoKoI
	5AjGWc2x8JaLFWX52o7bbhVEDuwAWPuT+Mk0FX6M4tLmes54L5KJJQj6C7gqVsn7Xd1MNBnP4KELr
	LEH7fAtw25xBcSG+s66o7mFprTMnfoB59Px7ggy6cGwXOOH3F0Bnqw+3trL8ONrcmCLcdsYtnQ/p9
	KQyh/wV1V4PgE/FfofQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goHfO-00078M-96; Tue, 29 Jan 2019 00:54:18 +0000
Received: from twspam01.aspeedtech.com ([211.20.114.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goHfL-00077j-Ll
 for linux-i3c@lists.infradead.org; Tue, 29 Jan 2019 00:54:17 +0000
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x0T0qdfC083360
 for <linux-i3c@lists.infradead.org>; Tue, 29 Jan 2019 08:52:39 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 29 Jan
 2019 08:54:06 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 29 Jan 2019 08:54:06 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: i3c application
Thread-Topic: i3c application
Thread-Index: AdS3bO5Ifw/HfVccSv2fDAJg+J3UeA==
Date: Tue, 29 Jan 2019 00:54:05 +0000
Message-ID: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x0T0qdfC083360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_165415_966020_F9013A1F 
X-CRM114-Status: UNSURE (   2.60  )
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

Hi all,
	I just work with I3C, does there have any application like i2c-tools I can used?
	Or any Linux i3c application I can have i3c slave and master loop test? 

Ryan Chen


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
