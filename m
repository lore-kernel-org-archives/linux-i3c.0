Return-Path: <SRS0=6/zw=SD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549E4C43381
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 16:58:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 213E22133D
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 16:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEjQWiM3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AgY30+eu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 213E22133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/UbxE/Fm3dhHi+3Bs8ukxCFWVQNC2Meg/7a0fw50EU=; b=DEjQWiM3sNs7xJ
	Yq/sISMQsyQ/i8Jwvo/L6WQtS7Ty2RaapF0oUA1pwHDGX1ILGbS/PRx+FCQfSGRPpaDR5rLj4imQk
	LUjGyP6exhM0dYd8fMsQ54EEWnfPg+QUFJvFUxHlfHOxryth+CJXfL9Okm7L8d+WWGh/mHe0X2aKN
	AAK3c8jCowxrmO7IsBj7Tq/IT1Yqg1mjPtGL9JMlH3dPHIFhBA1OZvgr4HmeO63nh7+YFu1rliXgI
	JlIzAOGQipgS+kjhB2qMU3FJaHp25Olz713LhvbrHPe3pUuvTvM/2ylK09P0MDZ6mcOdanGpiImTB
	HW66fzRyJIo3Ere8P1cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB0Ge-0002vr-MC; Mon, 01 Apr 2019 16:58:40 +0000
Received: from smtprelay2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB0Gc-0002vS-7q
 for linux-i3c@lists.infradead.org; Mon, 01 Apr 2019 16:58:39 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 74D2710C120D;
 Mon,  1 Apr 2019 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554137914; bh=2dO14B+frAZZlqP6gAJzcvfTXru02e8dMRqDY7FY18Q=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=AgY30+euYm0vIh/auHCnorjjGGg6Ah3z3t+JtJq1qVi3BpLAbCndZIXdSiGog8b6Q
 aXvSLirr+sA8tlJRMVGORTCm/AxjpagN79gmb21pXyDkHA3QY1SYRHhzeHtwsV3reb
 PtJkweCS40Yf9KG9WHBfB9PKP3yFS0Lnn8t+csXaS1zDW7tk3XBbbCnSgyo6PtoGp2
 f4sl5bQA/inqBI6+YSpnV4ydcwKGvzAcHDEo+RAVZ7fkWBeE12Wm1r4AEyjibFJuf5
 bkvgwmP8Mc8GCkMQFlYnAu11gNlBw36b7vVA1Yt+WmijoMcZdvXJlWd790JBLj5IMQ
 HUrrB/qjDJA1A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 366C6A005A;
 Mon,  1 Apr 2019 16:58:33 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Apr 2019 09:58:32 -0700
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Apr 2019 18:58:30 +0200
Received: from [10.0.2.15] (10.107.19.140) by DE02WEHTCA.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 1 Apr 2019 18:58:30 +0200
Subject: Re: [PATCH] i3c: master:dw: Fix dw_i3c_master_disable controller by
 using correct mask
To: Boris Brezillon <boris.brezillon@collabora.com>,
 vitor <vitor.soares@synopsys.com>
References: <9af6e8d204c7d846b727a9a010b79f1df7ecec1e.1551907779.git.vitor.soares@synopsys.com>
 <e02e8ce4-e392-99db-b1c1-d9b5046033d4@synopsys.com>
 <20190330085452.47ec2621@collabora.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <c6c02957-b3e6-b7d4-f590-848676455139@synopsys.com>
Date: Mon, 1 Apr 2019 17:58:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190330085452.47ec2621@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.140]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_095838_290484_C99BE04D 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

Thanks for your feedback.

On 30/03/19 07:54, Boris Brezillon wrote:
> On Wed, 27 Mar 2019 21:37:59 +0000
> vitor <vitor.soares@synopsys.com> wrote:
>
>> Hi Boris,
>>
>>
>> On 06/03/19 21:57, Vitor Soares wrote:
>>> The controller is disable by clear the DEV_CTRL_ENABLE bit rather
> 		      ^disabled by clearing
>
>>> than set it. This is fixed by using the correct mask.
> 	 ^setting
>
>
> The commit message is not accurate. You were not setting the
> DEV_CTRL_ENABLE bit, you were actually masking all other bits and
> keeping the DEV_CTRL_ENABLE one unchanged.
>
>>> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
> Missing
>
> Cc: <stable@vger.kernel.org>
>
> line.
>
> Can you send a new version with this fixed?
>
> Thanks,
>
> Boris
>

Sure.


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
