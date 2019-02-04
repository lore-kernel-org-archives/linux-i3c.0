Return-Path: <SRS0=lDAc=QL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88017C282C4
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Feb 2019 07:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A4320815
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Feb 2019 07:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="emPNLe+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A4320815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Xn8IO3jpYX18CT3v1RKWeS4STk8aafpa2p6oVfPIMI=; b=emPNLe+Egdql1u
	wDBKvhiZb5Bs2L1aoKjrcDvQi02/W/eOfA1OpKgAeAGDWlaU/GL+UXp+PvqlaC6lxE8tHLgQ92emf
	AntED2XLq51ivq0YbyDQeLgVGMAZPB91+9ugEuB3NDQiDSjrRNqAYJ7trekcqqXJFP+USQKhFUnu0
	XWP5DU8e4AWyWMm3Nks+Bi91P5muqH0FjijwMZworUarMNQXXE7+OBqxyW00sBPAFD1QCc+JSFGIe
	aSMtnUAmZ3BVTXHgBtpsFmQoKaO+VjAkrfrV3IRQHXm594tQnQd4vVVh1TLTyWe6GGLTTEr/kuUVM
	wyNlLYS83SyutrraVEnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqYMm-0004cV-Ra; Mon, 04 Feb 2019 07:08:28 +0000
Received: from twspam01.aspeedtech.com ([211.20.114.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqYMj-0004bh-BS
 for linux-i3c@lists.infradead.org; Mon, 04 Feb 2019 07:08:27 +0000
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x1476HOr026041;
 Mon, 4 Feb 2019 15:06:17 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Mon, 4 Feb
 2019 15:08:06 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Mon, 4 Feb 2019 15:08:06 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "'Boris Brezillon'" <bbrezillon@kernel.org>
Subject: RE: i3c application
Thread-Topic: i3c application
Thread-Index: AdS3bO5Ifw/HfVccSv2fDAJg+J3UeAAJsvCAALM2vQAAUL9XgAAcbxEA
Date: Mon, 4 Feb 2019 07:08:05 +0000
Message-ID: <000f01d4bc58$5da6bf60$18f43e20$@aspeedtech.com>
References: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
 <20190129143021.475588a7@bbrezillon>
 <002b01d4baa3$a36667a0$ea3336e0$@aspeedtech.com>
 <20190203183351.20882145@bbrezillon>
In-Reply-To: <20190203183351.20882145@bbrezillon>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Microsoft Outlook 16.0
Content-ID: <0DC26697737D284E8C67FF425CC96993@aspeedtech.com>
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x1476HOr026041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_230825_646992_5B10A746 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, 'Vitor
 Soares' <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Boris,
> >+Vitor who started a discussion around i3c-tools and the associate
> > kernel <-> userspace interface.  
> 
> Does there have open source repo in internet? 

>AFAICT there's nothing implemented yet, we just started discussing it.

> 
> 
> > Hi all,
> > 	I just work with I3C, does there have any application like 
> > i2c-tools
> I can used?
> 
> >No, but I'll ask the same question I already asked Vitor: what would 
> >you
> use i3c-tools for? What should it contain? I'm not against the idea, 
> but I'd like to delimit the scope of the userspace >interface.
> 
> 
> Sure, it definitely a user space application.
> I will connect with some i3c device or have loop back interact. I3c 
> master <-> i3c slave

>>Sorry, I don't get it. I don't know what you mean by loop back. I also
don't see why you absolutely need a user-space app to interact with a device
when you can develop a simple driver >>running in kernel space, and I see no
answers to these questions in your reply.


> 
> > 	Or any Linux i3c application I can have i3c slave and master loop
> test? 
> 
> >>Not sure I get this request correctly. Are you talking about a dummy 
> >>slave
> driver that would return any data it receives to the TX queue so that 
> the next read request coming from the >>master returns what the master 
> wrote in its previous write access?
> 
> 
> >>If that's what you have in mind, then it's definitely not supported.
> >>But before we even consider doing that, we should first introduce 
> >>the
> concept of I3C slave controller and then decide how we want to expose 
> slave features. Note that Vitor and I disagree >>on the solution: I 
> think we should mimic the USB gadget approach (where you can attach a 
> generic profile to any USB device controller), and Vitor thinks slave 
> IPs should have their
> >>profile/feature-set hardcoded in the driver (which works fine for
> hardcoded slave IPs, but is not that great if the slave block is generic).
> 
> Thanks, if I can refer from with I3c-tools, I can start for i3c-master 
> and i3c slave dummy test.

>>As I already said above, there's no i3c-tools yet, and there won't be
until we are clear on what this project should contain and what the kernel
<-> userspace interface should look like.

>>Can we have a more detailed description of your use case please?

Sorry for confuse. 
Let me explain more. 
For example at i2c, In our SOC, we have i2c slave and master. So I can use
I2c slave to be dummy memory device. And I can connect my I2c master and
slave.
I2c master use i2c-tools to have i2cget, i2cset for read/write i2c slave
dummy memory.

So, I just wonder if i3c have some user application that I can have a start
point. It will easy way for me do the same thing. 


Regards,

Ryan

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
