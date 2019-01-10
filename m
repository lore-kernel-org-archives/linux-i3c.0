Return-Path: <SRS0=5ZYP=PS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41696C43387
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Jan 2019 15:16:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10EC9214DA
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Jan 2019 15:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVNhdSNI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gqsqj2eV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10EC9214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1j14jx9l/U+Vod8FAAkNurh8etLoLBiM0xk85MjyWA=; b=uVNhdSNId/leum
	wOyp5petzqKbPZy9AvbyMiv1Xm4q/dwzHgoU0gJiXtai/j4OEmP2CtMs968Jr6Raz/vbk8c71TVCY
	jDKs+JQcHCQZCvPIjN8LszAnhan/UluVGaKqn4+L4eG2cMl/rMB3XwxQ+exFCnEM1xeY9+jkIGkIH
	IS74k2MthmyYu+p+tgHwjGSIoZ0vz2zXKSOgkRoxWGPkdBpa4kl1zm/wHyS6R621hS9c4PKhpDBLM
	zT7ClxK4RPCLR7+5gyh9DoivKAulbXXoefazogtAQQPyDNaxqEtocTRjmJ7q7xulIrBOOZJD9UldG
	UhXDvciqQ6wfVIUwUbow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghc4J-0003Zl-KT; Thu, 10 Jan 2019 15:16:27 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghc47-0003LH-Ua
 for linux-i3c@lists.infradead.org; Thu, 10 Jan 2019 15:16:19 +0000
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
 by smtprelay.synopsys.com (Postfix) with ESMTP id 7DF3C10C0AE2;
 Thu, 10 Jan 2019 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1547133372; bh=egLuX8E4ilRS7rKST4GSkxfiChUsc7W5IvknoV+ihTc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=gqsqj2eVqgRjjvoxQ5sjTIZ1MBIbKPQ6XjYBXRFlgxzL5gNK3v6l5uCDhlEIrhYn2
 /kmnqg1Va/ckV3n2mgQl7S+DU4Qk/m0aid7CIAok40JTKXRdem+sJFTu208b9wPZsd
 WnCb1i8rLeO0PLBGVfFSGA+cfCBvC6dDNOn1G+Ba9L9YIjZpHivr8Ly439cRWfrmF5
 +/W62NW1PHkKYxeL/vvHCXuV4c/aMRYPvFAKT/CN0bhgdLW7nGSXBVW1ze2BBaQABB
 6eGWZ+DEyp1D5S5XZkxjU4shWf0DsCw2x6w9pk8SXqRmKvlTchzRq4iRb/4aII9NVk
 agzEMJkhyctwA==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 71F4557E4;
 Thu, 10 Jan 2019 07:16:12 -0800 (PST)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 10 Jan 2019 07:16:12 -0800
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 10 Jan 2019 16:16:10 +0100
Received: from [10.0.2.15] (10.107.19.92) by DE02WEHTCA.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Thu, 10 Jan 2019 16:16:09 +0100
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix i3c_attach/reatach
To: Boris Brezillon <bbrezillon@kernel.org>,
 Vitor Soares <vitor.soares@synopsys.com>
References: <2e33e1f72db978f77ced019ae085c972050ca4e9.1547040890.git.vitor.soares@synopsys.com>
 <20190109184846.56c75c3f@bbrezillon>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <62425765-2484-b998-7573-685aa4996976@synopsys.com>
Date: Thu, 10 Jan 2019 15:16:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190109184846.56c75c3f@bbrezillon>
Content-Language: en-US
X-Originating-IP: [10.107.19.92]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_071616_496925_BF731734 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 09/01/19 17:48, Boris Brezillon wrote:
> On Wed,  9 Jan 2019 15:58:05 +0100
> Vitor Soares <vitor.soares@synopsys.com> wrote:
>
>> This patch fix i3c attach/reatach functions.
>>
>> During the i3c_attach the driver doesn't threat the static address used for
> 					   ^treat?
>
>> SETDASA CCC command.
> Or maybe
>
> "
> During the i3c_attach the driver *ignores* the static address used for ...
> "
>
>> During the i3c_reatach the driver doesn't update master->addrs[data->index] with
> 		 ^reattach
>
>> new address if old_dyn_addr = 0.
>>
> Missing Fixes tag here:
>
> Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
>
>> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
>> ---
>>  drivers/i3c/master/dw-i3c-master.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index b532e2c..b84acbc 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -901,9 +901,6 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>>  	       master->regs +
>>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>>  
>> -	if (!old_dyn_addr)
>> -		return 0;
>> -
>>  	master->addrs[data->index] = dev->info.dyn_addr;
>>  
>>  	return 0;
>> @@ -925,11 +922,11 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>>  		return -ENOMEM;
>>  
>>  	data->index = pos;
>> -	master->addrs[pos] = dev->info.dyn_addr;
>> +	master->addrs[pos] = dev->info.dyn_addr ?: dev->info.static_addr;
> 						^ add a space between '?' and ':'
>
>>  	master->free_pos &= ~BIT(pos);
>>  	i3c_dev_set_master_data(dev, data);
>>  
>> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
>> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->addrs[pos]),
>>  	       master->regs +
>>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>>  

Thanks for your feedback. I will fix it and resend.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
