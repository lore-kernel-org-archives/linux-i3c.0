Return-Path: <SRS0=k+Rg=4Q=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33318C3F2D2
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2020 12:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0717524677
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Feb 2020 12:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sApfAFSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0717524677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEMhbos4VLP3lEZ+rHJbjey/tXWOqYfRPOXzblfGhgE=; b=sApfAFScUhy7U1
	Y76P+RFmSbnrKFzKBIR8Bi+9KsveNwMMI/Sty6FJGjyhwA8a6PH1EdNLG7BAZbBzKsFCS9qXwYJmM
	VzEWwX/9e+SuTp16tA/KWUMNBYb73u1dWSd7d5iEJULDaaH2spQBFkeakzgKuFw38PwB3puViqowt
	9uebHWDuYyCgQB+6D/cmugUJK88DnKQJeGh2N6ay+q0DW9JJf0c9MXVxh+CgcwrkpMl9wSm5xYrrR
	hLnX0Rn9xeu4JOfPI0v6kYzio/Qc2RJXjADraAj5YNR29GNtvoIu7sxx5ISbh9VMqbTEQKBnbO9RI
	bBCuhanfY9ji4x5KYaEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7eV4-0002vY-MD; Fri, 28 Feb 2020 12:12:14 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7eV1-0002td-Bl
 for linux-i3c@lists.infradead.org; Fri, 28 Feb 2020 12:12:12 +0000
Received: from [109.168.11.45] (port=49168 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1j7eUj-001wQh-Pt; Fri, 28 Feb 2020 13:11:53 +0100
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
Date: Fri, 28 Feb 2020 13:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_041211_555910_53E71E70 
X-CRM114-Status: GOOD (  13.76  )
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

On 21/02/20 11:13, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>> With i2c_new_ancillary_address, we can check if the intended driver is
>> requesting a reserved address. Update the function to do these checks.
>> If the check passes, the "reserved" device will become a regular "dummy"
>> device.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -975,6 +975,8 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>>                                                 u16 default_addr)
>>  {
>>         struct device_node *np = client->dev.of_node;
>> +       struct device *reserved_dev, *adapter_dev = &client->adapter->dev;
>> +       struct i2c_client *reserved_client;
>>         u32 addr = default_addr;
>>         int i;
>>
>> @@ -984,7 +986,21 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>>                         of_property_read_u32_index(np, "reg", i, &addr);
>>         }
>>
>> -       dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
>> +       dev_info(adapter_dev, "Address for %s : 0x%x\n", name, addr);
>> +
>> +       /* No need to scan muxes, siblings must sit on the same adapter */
>> +       reserved_dev = device_find_child(adapter_dev, &addr, __i2c_check_addr_busy);
>> +       reserved_client = i2c_verify_client(reserved_dev);
>> +
>> +       if (reserved_client) {
>> +               if (reserved_client->dev.of_node != np ||
>> +                   strcmp(reserved_client->name, I2C_RESERVED_DRV_NAME) != 0)
>> +                       return ERR_PTR(-EBUSY);
> 
> Missing put_device(reserved_dev).
> 
>> +
>> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, sizeof(client->name));

Any strong reason for not giving the device a more informative name?
Reading "dummy" in several /sys/bus/i2c/devices/?-????/name files is not
helping. Using the 'name' string that is passed to
i2c_new_ancillary_device() would be way better, perhaps prefixed by
dev->name. But this opens the question of why not doing it in
i2c_new_dummy_device() as well, which currently receives no "name"
parameter.

Of course this is not strictly related to this patch and can be done in
a later step.

About the patch itself, except for the issues pointed out by Geert the
approach looks generally good to me.

-- 
Luca

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
