Return-Path: <SRS0=X30F=SE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901CC4360F
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44FDF20856
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qo6Pv+oK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L3RfgB3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44FDF20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE5EfTAKKUronz7FoOiT0EgcA01LKkCY1LKYwmVAGoo=; b=Qo6Pv+oKGsiW+l
	KCB4oKvHRTjFl6BnJk31iUAJ3Ykrp1I6Tnp7k5FGDtkgBIAzZQ3SOr9BOrJzJr0gASXLhdTt2mZmR
	ZoNyFKzPak0dcJxrm+Re69hw0QaaSfi8Jl8sCMJTZjd84DfyYT600TnaJ1aB2WJtJiUb7hzECjR6c
	anVvOHhhsexWG6ANvo/RfiVZcbgDSg0J3/AM8EdpeUPpMz2tqeX/o5JPcQPazFW3HOTyfGYoQIG0g
	vrgXI0dDG5cpfJLf/XUUVJ4T/tIjyfcVFrVjbEc04Uw5eQaMeGsfswloiVgpLzO+2KFoCh+5zQw1s
	93AXry2n6iymCPV4Xf+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBHex-0000eh-RM; Tue, 02 Apr 2019 11:32:55 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBHev-0000dj-52
 for linux-i3c@lists.infradead.org; Tue, 02 Apr 2019 11:32:54 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 46FBC10C1C88;
 Tue,  2 Apr 2019 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1554204769; bh=YShPjsK0wS91U84yCVqK1D648tgKgZqGEmVzFPeP2so=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=L3RfgB3l33IAj99evrBuapZeQKWAynNJprJRB3fM5KaZYlFw571IILtbyZECtYl4F
 TYbeqQGiUckbdHj6yHtK8qYJHJoF7eq2thjFW7Qo2tbhEZ6xryPsY7Nh3+HyfRJVZE
 qQI1IcwM7xxG0EkSOLtQ1dVD1F2AjAaXAD6Aj2dx41Kk6hhmkvNl5gaeWBdYkKZL01
 JBAeJwSiPeFeQbHlbcVtNclZaCeIEfUyIclvHRmcPFIwWiEJmhuu6UswLZunWuimib
 yIedRA1oN1iQUpS/E9ced4FgyzMDULSNHPdzXSUVF0pv/fzesV84Q9E+J+f1I+ED3a
 6DKHkJuELAo9A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 02E61A005A;
 Tue,  2 Apr 2019 11:32:48 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Apr 2019 04:32:48 -0700
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.94) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 2 Apr 2019 13:32:46 +0200
Received: from [10.0.2.15] (10.107.19.140) by DE02WEHTCA.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Tue, 2 Apr 2019 13:32:46 +0200
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
To: Przemyslaw Gaj <pgaj@cadence.com>,
	vitor <vitor.soares@synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
 <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
 <20190401203148.028cdf01@collabora.com>
 <2257791c-6bef-3015-664b-470ebf55b726@synopsys.com>
 <20190401212447.4e992f60@collabora.com>
 <f1d1a287-139f-1b0e-e4ad-b375cf693186@synopsys.com>
 <20190402112244.GA23976@global.cadence.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <b9a810fb-6d92-1d8b-c2e0-35d3617e4e64@synopsys.com>
Date: Tue, 2 Apr 2019 12:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190402112244.GA23976@global.cadence.com>
Content-Language: en-US
X-Originating-IP: [10.107.19.140]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_043253_206823_8DE2AB2D 
X-CRM114-Status: GOOD (  21.40  )
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
Cc: linux-i3c@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>, rafalc@cadence.com,
 agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 02/04/19 12:22, Przemyslaw Gaj wrote:
> Hi,
>
> The 04/02/2019 12:10, vitor wrote:
>> Hi,
>>
>>
>> On 01/04/19 20:24, Boris Brezillon wrote:
>>> On Mon, 1 Apr 2019 19:48:45 +0100
>>> vitor <vitor.soares@synopsys.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> On 01/04/19 19:31, Boris Brezillon wrote:
>>>>> On Mon, 1 Apr 2019 19:17:03 +0100
>>>>> vitor <vitor.soares@synopsys.com> wrote:
>>>>>  
>>>>>> Hi,
>>>>>>
>>>>>> On 30/03/19 14:36, Boris Brezillon wrote:  
>>>>>>> On Sun, 10 Mar 2019 13:58:38 +0000
>>>>>>> Przemyslaw Gaj <pgaj@cadence.com> wrote:
>>>>>>>    
>>>>>>>> I need to store address and lvr value for I2C devices without static definition
>>>>>>>> in DT. This allows secondary master to transmit DEFSLVS command properly.
>>>>>>>>
>>>>>>>> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
>>>>>>>> ---
>>>>>>>>  include/linux/i3c/master.h | 5 +++++
>>>>>>>>  1 file changed, 5 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>>>>>>>> index eca8337..3c27d9f 100644
>>>>>>>> --- a/include/linux/i3c/master.h
>>>>>>>> +++ b/include/linux/i3c/master.h
>>>>>>>> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
>>>>>>>>   * @common: common part of the I2C device descriptor
>>>>>>>>   * @boardinfo: pointer to the boardinfo attached to this I2C device
>>>>>>>>   * @dev: I2C device object registered to the I2C framework
>>>>>>>> + * @addr: I2C device address
>>>>>>>> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
>>>>>>>> + *	 the I2C device limitations
>>>>>>>>   *
>>>>>>>>   * Each I2C device connected on the bus will have an i2c_dev_desc.
>>>>>>>>   * This object is created by the core and later attached to the controller
>>>>>>>> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
>>>>>>>>  	struct i3c_i2c_dev_desc common;
>>>>>>>>  	const struct i2c_dev_boardinfo *boardinfo;
>>>>>>>>  	struct i2c_client *dev;
>>>>>>>> +	u16 addr;
>>>>>>>> +	u8 lvr;    
>>>>>>> You also need to remove lvr from i2c_dev_boardinfo and adjust the code
>>>>>>> to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
>>>>>>> patch 3.
>>>>>>>    
>>>>>> Why can't we keep the lvr and addr in i2c_dev_boardinfo and need this information on i2c_dev_desc?  
>>>>> Because i2c_dev_boardinfo is extracted from the DT and the secondary
>>>>> slaves does not necessarily have this description. The idea is to keep
>>>>> reserving the address slot for the I2C device even if we don't expose
>>>>> it to the upper layers.  
>>>> So you are using i2c_dev_boardinfo just for DT devices?
>>> All devices that are described in some way, can be through DT, ACPI or
>>> board-file desc (only DT is supported right now, but we can easily add
>>> support for other formats).
>> We can drop i2c_dev_boardinfo.
>>
> Why you think we can drop it? We are still using it for DT devices.

Until now you need it to hold LVR, if you pass it to i2c_dev_desc, the i2c_board_info can be used for DT.

>
>>>> Because at end we need to register the new i2c devs.
>>> No, only those that have a valid description, because there's nothing
>>> you can expose if you only have the address and LVR values. You at
>>> least need to know which driver this dev should be attached to
>>> (compatible string in your DT) and most drivers also need extra
>>> information (basically all the DT props that are described a the DT
>>> binding).
>> In any case the HC need to know the bus mode, how is this done?
> LVR is passed through DEFSLVS command.

Is HC driver who set the bus mode? Shouldn't be the subsystem when you register all devices?


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
