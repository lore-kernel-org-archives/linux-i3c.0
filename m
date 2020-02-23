Return-Path: <SRS0=2F95=4N=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF23C35DF5
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Feb 2020 11:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E237B2176D
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Feb 2020 11:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7MiHdgP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E237B2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1BnvEdayi+/ATJBOtatkM0S52gyybBvrx0NwduxmH0=; b=M7MiHdgPpa3aaE
	JXMA/l2bY9Hvo4AqPqmj3cHTVqYEzjiMIrUXRLUJfSHPt7ewp4zVHNECls8cExVa4fFvbsL4aer0f
	DGr/I9+OfVAtJ3cJwZ6SHjFchEjs1fi6jV6zzFaT2cbn7+Qnm6owpRYC+kQapJoaz6DqL1zuLVekp
	jf+6p1vjNieIjM8SLroNy/g7C5scqnr33j8QAM5xmSc/jh36IKj+DUdzJzYBkLBTB0j0cG9cVCOxQ
	QqC9udA8651/khLXYkHSX7CUJEgn8TOAiVCUhh0xIWMx3Zst9z0dA7dZ4Ytjd/9UzcoSDsJhOvSOl
	3scjgmxaAOvlT9izq3IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Yfi-0007eQ-1L; Tue, 25 Feb 2020 11:46:42 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j60PJ-0000DC-HZ
 for linux-i3c@lists.infradead.org; Sun, 23 Feb 2020 23:11:31 +0000
Received: from [78.134.20.33] (port=59608 helo=[192.168.77.67])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1j60P0-00FBU2-SK; Mon, 24 Feb 2020 00:11:10 +0100
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
Date: Mon, 24 Feb 2020 00:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_151129_744889_0B696BE1 
X-CRM114-Status: GOOD (  22.30  )
X-Mailman-Approved-At: Tue, 25 Feb 2020 03:46:40 -0800
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran@ksquared.org.uk>, Vladimir Zapolskiy <vz@mleia.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

On 21/02/20 10:45, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> Sometimes, we have unknown devices in a system and still want to block
>> their address. For that, we allow DT nodes with only a 'reg' property.
>> These devices will be bound to the "dummy" driver but with the name
>> "reserved". That way, we can distinguish them and even hand them over to
>> the "dummy" driver later when they are really requested using
>> i2c_new_ancillary_device().
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Cc:ing Alexandre who raised the need for a described-but-disabled I2C node.

> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> but one question below.
> 
>> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>> @@ -50,7 +50,6 @@ Examples:
>>                 reg-io-width = <1>;     /* 8 bit read/write */
>>
>>                 dummy@60 {
>> -                       compatible = "dummy";
>>                         reg = <0x60>;
>>                 };
>>         };
> 
> There's a second instance to remove 18 lines below.
> 
>> --- a/drivers/i2c/i2c-core-of.c
>> +++ b/drivers/i2c/i2c-core-of.c
>> @@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>>
>>         memset(info, 0, sizeof(*info));
>>
>> -       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
>> -               dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
>> -               return -EINVAL;
>> -       }
>> -
>>         ret = of_property_read_u32(node, "reg", &addr);
>>         if (ret) {
>>                 dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
>>                 return ret;
>>         }
>>
>> +       if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
>> +               strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
> 
> Could this cause a regression, e.g. if people already have such dummy
> nodes in their DTS, and use sysfs new_device from userspace to
> instantiate the device later?

Such a DTS would be illegal because "compatible" has been a required
property so far. Thus one could leave such people out in the cold
because they went on an unsupported path. Not super nice anyway.

However I'd like to view the issue from the DT point of view. DT
describes the hardware, and it is possible (and even desirable) that the
firmware provides the DTB independently from the OS, and the kernel
consumes it. It this scenario, firmware could and should describe all
I2C slaves with proper "compatible" property, and there is no way to
remove it, in a clean way at least.

But the kernel currently ignores nodes that have no matching driver,
right? So in this case the kernel knows that that address is used, but
ignores this information and considers the address as available.
Seen in this perspective, we should have a "compatible" for all nodes:
it is just describing the hardware and could be out of the kernel
control. But instead of discarding all nodes without a matching driver,
the i2c-core-of code should mark them as "reserved".

Does it sound correct?

Clearly this does not fit the case reported by Alexandre: a device
having a driver which is known to be badly buggy, so we don't want to
instantiate it. But again, this should not affect DT as it is not
describing the HW, but only an implementation detail. Probably disabling
or blacklisting the driver would be a better option there?

My apologies to Wolfram, I appreciate a lot the effort you are doing,
but before reviewing this patch I have never realized what I tried to
explain above.

-- 
Luca

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
