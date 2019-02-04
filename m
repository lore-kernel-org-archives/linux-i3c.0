Return-Path: <SRS0=lDAc=QL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BACC282CC
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Feb 2019 10:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FAB2073D
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Feb 2019 10:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ke246zGt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JjnOKOWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FAB2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdylELlUWXYaqgw6h6NWwruLW4SoIZ7LxD5f4p2KYrU=; b=ke246zGtEXL8cB
	ctsSouk7BDyQWJeYNzrv7C7zhbcLKHSrVbWZwaLZfm9Uj+hhyJ/2kDQrYU+YF5sGtKV28O4KUup2g
	d3KxF5CHvWMi2khS/x3ZKyDzZeUQAYgPgzMSq5vINcVLxLgZ927N1SfvnTd6Jb1+4+6KG1EoolGO0
	EBHMzseZflO91HbD+215NTACUAuiVcWMCcGfOWeaqoOsrehwbiDl3PADPJx2xUgQOu7xAgF0i1PpC
	YPIGLM1Ft54L85kX2euf3/4JgDRSkTSw7RrhUsM773ld3Eb250yn3cczob0weNPttBoJiCgyG4Zgi
	d5a0ETEacmjqbVphWl2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqbyj-0004ag-DH; Mon, 04 Feb 2019 10:59:53 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqbyg-0004Zf-Cu
 for linux-i3c@lists.infradead.org; Mon, 04 Feb 2019 10:59:51 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 0E01E10C189C;
 Mon,  4 Feb 2019 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1549277988; bh=/cKiGfePiT/xkBe4hR/GSyZhLLUzNqxsHL3bZxzfeVk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=JjnOKOWAFwPhPNE4nENiLhQBEjnwhprWMr8v0cTqVflG/TV6t6wo+A/rgkWodkMhz
 JJFX7F+CBGTEpPPTfJMTj+A7Bm6vwNzKLikOAC5xIzbaAZJMg+jHEF7LjPOQ7l7kBK
 3xXUojDHXFrK0/1fUQ4/b933wrt4ddsOWLzLz9aqH1x0T3+YK4+3VXhLX/CB2m+JmZ
 EUAQQZbpmrt0jEbT6VKJLJ4NilmBn7LpZJ1pZlFPmwz5EMMmueJaHWcfjD2caYNZt5
 9Udf4vKXgMx9JvbpDKr7+7YjfKO727aMEjV2V6OKgjdfLZAQZmDY06BR2VMZyCU+oH
 Fbs5/OXBl0p0g==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0FC8EA005D;
 Mon,  4 Feb 2019 10:59:44 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 4 Feb 2019 02:59:22 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 4 Feb 2019 11:59:20 +0100
Received: from [10.0.2.15] (10.107.19.107) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 4 Feb 2019 11:59:19 +0100
Subject: Re: i3c application
To: Ryan Chen <ryan_chen@aspeedtech.com>, 'Boris Brezillon'
 <bbrezillon@kernel.org>
References: <f778a542ef6647069681ed4a4d35c907@TWMBX02.aspeed.com>
 <20190129143021.475588a7@bbrezillon>
 <002b01d4baa3$a36667a0$ea3336e0$@aspeedtech.com>
 <20190203183351.20882145@bbrezillon>
 <000f01d4bc58$5da6bf60$18f43e20$@aspeedtech.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <2dfbed05-1dba-c297-ae44-e54aa3ab13a2@synopsys.com>
Date: Mon, 4 Feb 2019 10:59:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <000f01d4bc58$5da6bf60$18f43e20$@aspeedtech.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.107]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_025950_447163_38EA2CDB 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 'Vitor  Soares' <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Ryan,

On 04/02/19 07:08, Ryan Chen wrote:
> Sorry for confuse. 
> Let me explain more. 
> For example at i2c, In our SOC, we have i2c slave and master. So I can use
> I2c slave to be dummy memory device. And I can connect my I2c master and
> slave.
> I2c master use i2c-tools to have i2cget, i2cset for read/write i2c slave
> dummy memory.
>
> So, I just wonder if i3c have some user application that I can have a start
> point. It will easy way for me do the same thing. 
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
