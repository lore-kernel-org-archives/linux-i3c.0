Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC39EB64DD
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jul 2023 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd7eorjoGRINSJC77m/FSYvTdLJPfAQHG262vyVOKKg=; b=qM0072qGIp20N1
	V51gaiHcKSgyKQryPZd/fbJkOG6vgj6U1v6USj4WHZbY+XHbOH50+Ni+rDXfBzZaZ97Q3b7V6PGem
	onvjP2vQ9XmbY4tsc1S/p8FmjxHbq2uaFVodvmsPcMLpPc29V/jBB6GMYUKXI32b0l70mRtazNWG7
	6XPPXuQjDu92xLgajjgQ5K4rEXB5D7YBM4jsDceGRp+sgboXKxGhCTdJGzvRt/RmySAoj66uhS0lv
	QOmf3w64fo2bO6zpF6HUgfr66XKvTet6CHpc704paUADGxgnbRmaUwvRtRziy8Jk+7tSY4lQWgcjN
	MjtagSnM6DD9jnRCBPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ96l-00EAwu-2I;
	Tue, 11 Jul 2023 08:52:31 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ96i-00EAv6-23
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jul 2023 08:52:30 +0000
Received: from 82-132-229-125.dab.02.net ([82.132.229.125] helo=[192.168.252.81])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qJ96f-007H2X-LE; Tue, 11 Jul 2023 09:52:25 +0100
Message-ID: <eb115b92-35f7-2ea7-0cd2-b825e769186e@codethink.co.uk>
Date: Tue, 11 Jul 2023 09:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 5/5] i3c: dw; add print if cannot get resources
Content-Language: en-GB
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
 <20230621162005.473049-6-ben.dooks@codethink.co.uk>
 <2023070421375530819b2c@mail.local>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2023070421375530819b2c@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_015228_670910_0182ACCA 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 04/07/2023 22:37, Alexandre Belloni wrote:
> Hello,
> 
> Please fix the typo in the subject.
> 
> On 21/06/2023 17:20:05+0100, Ben Dooks wrote:
>> The devm_reset_control_get_optional_exclusive() call does
>> not print any errors, neiterh does the clk_prepare_enable
> Also fix this one.
> 
>> or devm_request_irq() call.
>>
>> Add some basic error printing to make the probe failures
>> easier to debug.
> 
> I guess all those dev_err could be dev_dbg so we don't litter the driver
> with strings that will only ever be useful during bring up.

I think dev_err_probe() is probably the right one as we aren't going
to want to warn on any sort of probe defer errors. However most drivers
are printing errors if there are resources missing so I think an error
is the best way to report issues.

I'll correct the spelling when the discussions about the correct way to
print errors is.

>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>> index 9332ae5f6419..ffc84ff6225c 100644
>> --- a/drivers/i3c/master/dw-i3c-master.c
>> +++ b/drivers/i3c/master/dw-i3c-master.c
>> @@ -1429,12 +1429,16 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>>   
>>   	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
>>   								    "core_rst");
>> -	if (IS_ERR(master->core_rst))
>> +	if (IS_ERR(master->core_rst)) {
>> +		dev_err(&pdev->dev, "cannot get core_rst\n");
>>   		return PTR_ERR(master->core_rst);
>> +	}
>>   
>>   	ret = clk_prepare_enable(master->core_clk);
>> -	if (ret)
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "cannot enable core_clk\n");
>>   		goto err_disable_core_clk;
>> +	}
>>   
>>   	reset_control_deassert(master->core_rst);
>>   
>> @@ -1446,8 +1450,10 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>>   	ret = devm_request_irq(&pdev->dev, irq,
>>   			       dw_i3c_master_irq_handler, 0,
>>   			       dev_name(&pdev->dev), master);
>> -	if (ret)
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "cannot get irq\n");
>>   		goto err_assert_rst;
>> +	}
>>   
>>   	platform_set_drvdata(pdev, master);
>>   
>> -- 
>> 2.40.1
>>
> 

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
