Return-Path: <SRS0=1TEA=QM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1B9C282CB
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Feb 2019 14:49:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDACF217F9
	for <linux-i3c@archiver.kernel.org>; Tue,  5 Feb 2019 14:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7iWb+qg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDACF217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLJGXole3bDbUAvM2+HIUe2Rlgcf6/LeNtHwK+DcbdQ=; b=c7iWb+qg0XEU9M
	yTCxIUVdB/j8i0UUxoh5lac0T+kU4AmdgR/8a5+xUovZiJtrQcPANAKKLR15Ie1qR8Jy8+mn4btuy
	3clc1hy9er3pg4uarwP5fPbEiq5gKdSDQaGqCk/fJSuQAdoG4svyvigYRviyvGyl+G3jaRiOQU5fU
	NRSiC17gInQgTVQjki2TXH3aPGGPFkm81lAVOLlXOa6ryvDRG2EmYxhDHj8qWTzzukMefk6nngUWS
	NjTR/q7BE6AdjWl/begWqa8n+tnUUy9F9/lU0T1SkW4wXzljNonBaIMz2Q8Bl2vuHMPxrPh6lfSTw
	PKTWPoEq+78Qa5K3wsYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr22n-0007bl-Ec; Tue, 05 Feb 2019 14:49:49 +0000
Received: from twspam01.aspeedtech.com ([211.20.114.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr22e-0007bC-7f
 for linux-i3c@lists.infradead.org; Tue, 05 Feb 2019 14:49:48 +0000
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x15ElPUO002758;
 Tue, 5 Feb 2019 22:47:25 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 Feb
 2019 22:49:20 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 5 Feb 2019 22:49:19 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "'vitor'" <vitor.soares@synopsys.com>, "'Boris Brezillon'"
 <bbrezillon@kernel.org>
Subject: RE: i3c application
Thread-Topic: i3c application
Thread-Index: AdS3bO5Ifw/HfVccSv2fDAJg+J3UeAAJsvCAALM2vQAAUL9XgAAcbxEAAAgTioAAOlLQAA==
Date: Tue, 5 Feb 2019 14:49:19 +0000
Message-ID: <004301d4bd61$f6d664b0$e4832e10$@aspeedtech.com>
References: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
 <20190129143021.475588a7@bbrezillon>
 <002b01d4baa3$a36667a0$ea3336e0$@aspeedtech.com>
 <20190203183351.20882145@bbrezillon>
 <000f01d4bc58$5da6bf60$18f43e20$@aspeedtech.com>
 <2dfbed05-1dba-c297-ae44-e54aa3ab13a2@synopsys.com>
In-Reply-To: <2dfbed05-1dba-c297-ae44-e54aa3ab13a2@synopsys.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Microsoft Outlook 16.0
Content-ID: <1A2884F539FF9A4BAF1FBCDAE4CE2BC1@aspeedtech.com>
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x15ElPUO002758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_064940_534767_1398D4B5 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Boris,
	Got it. Thanks a lot

-----Original Message-----
From: vitor [mailto:vitor.soares@synopsys.com] 
Sent: Monday, February 4, 2019 6:59 PM
To: Ryan Chen <ryan_chen@aspeedtech.com>; 'Boris Brezillon' <bbrezillon@kernel.org>
Cc: linux-i3c@lists.infradead.org; 'Vitor Soares' <vitor.soares@synopsys.com>
Subject: Re: i3c application

Hi Ryan,

On 04/02/19 07:08, Ryan Chen wrote:
> Sorry for confuse. 
> Let me explain more. 
> For example at i2c, In our SOC, we have i2c slave and master. So I can 
> use I2c slave to be dummy memory device. And I can connect my I2c 
> master and slave.
> I2c master use i2c-tools to have i2cget, i2cset for read/write i2c 
> slave dummy memory.
>
> So, I just wonder if i3c have some user application that I can have a 
> start point. It will easy way for me do the same thing.
>
>
> Regards,
>
> Ryan
>
As Boris said for now there is nothing like i2c-tools for i3c.

Based on initial discussion with Boris, I'm working on something to submit soon.


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
