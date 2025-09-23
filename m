Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AE8CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukN6aOsRDQ7Nwzy0tkIYKvT5hNjZu2CTNncxzRTnj2E=; b=q1QWOdVB5cxTfF
	0EeAGUaDyZBxBFf7Xc29HZwUIrw9uj2DaZslzXFTidiFk5Ev4EkRVt5rK088MmYaoxnwXn5SItC+F
	O3sTBCRuryI3/ACn5IF8EqtT3FmOAOA7Pkj0A35qPI0YrVM0BNKEJTIO07+GqprO+t0s+o1jjkUIx
	k6//rD7552DCoDK31UCg+CsKu3oRvwL2hXJ15fIVYwolcc/GHI51jA+zQ7sWI1QJj7zjGRKH9HC3z
	3Ja1EMt8YtrSn3TaYfQxTMtl2L9E3eHOBH93xt/oUcHmuptuepa7oIkRKhrx9FkNaFBkvbO58Kjng
	Ks0hcl2R54ypGLgmmsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v182R-0000000EZL2-1YSX;
	Tue, 23 Sep 2025 18:46:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v182O-0000000EZKe-1ImC
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 18:46:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEhUP2014953
	for <linux-i3c@lists.infradead.org>; Tue, 23 Sep 2025 18:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtQw/V4XpWdaaHnPQf7zCiqtInba45x5FdbZXPH6rbE=; b=CyyJCOQ1gPfBFrrG
	P8hmrBYTgD5lS07STFi/PQYW8JYs0ZGixpVfZtr1F0EvprgWU9v2difrGy+ykRHP
	sYsNg7nWkvNgZNlSdz9s9/2LqIEo76nLhGVIQAHksFfEVPA944KhGxEJh+aZf9Az
	JOK7ZrI+v7bWJcsS4346vjQLYy8nJt2Ok5zDJCkaKFBqjipOqIUiUh7vuuYThlZo
	hczzUscVWqfJ4fHqxb5scZOcIWQckUUemvrehiLn3/K+8RaN2e9IH3olo2D3Tkwt
	oypbuvG1rEy6J2AgZi4YL8DZ+7mTacjRNuHGy21Fst2eyXTclQowxflWY3faKnyF
	9wLhLw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk5n5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 23 Sep 2025 18:46:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269939bfccbso75038675ad.1
        for <linux-i3c@lists.infradead.org>; Tue, 23 Sep 2025 11:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653209; x=1759258009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtQw/V4XpWdaaHnPQf7zCiqtInba45x5FdbZXPH6rbE=;
        b=ZcT1evYVa41GAwtu5ihocgGkdZOGCxiGQsCmxM++Dpbt9/lEs3axYnrw9TXXgqVQbN
         5RBVL7g1aStM0a89+184nKICi/LjmsiadIdPt2bdpRB6NzXP47RNy0ArkhNAURC8Pa1h
         kSwef5pC/9Zi8iN8233EjVASll3BLBXiel1/5feFcpoNs+8Ljo0MqoWKNfWQ1K3e8kp6
         dNtA++Z/vBFP6So33TIlMYAyS1+FxpQM4ANf9XZGgFXR7zUwuLz0/L1uxgOhGT1doQ3J
         2aNJXb/a6ioTADTaOwBq+MQZPQ6ASF8ee1NdjFY8OvUzkDBpaENMwBUDkgFbf0Vq1feP
         nnzA==
X-Gm-Message-State: AOJu0YyymLb0IMEBv0JBIkpC+Clmq2AmHYGvfw3OF/whFVWa3s0E5VaJ
	FhXSDM7WxyJYZikj9YX390bnYsOAsfj8HxAdjdYa2hU1neW1HqM6By3LuvWkOpdH0dh/uQzIpPO
	F9Fpt7ZAbDFfIuGx+yCtyP/Ukkka2YROkoykeQkcap3UdGWSEner1qs+oIXAbS41ZoFdemJvH1K
	7K
X-Gm-Gg: ASbGncuSyYDpxyHWAATd7hBQMHRF8+aqDrLReo8iSqr8ZnZL3BhcNZvxhHP+y+dTzky
	HiOhFRugIhr/7woEYndHGSulkDiSJztiGMPtsGqPCHgzRar8w7FQAg8CPHuivt6mPkURHH+3HaZ
	mfE436NYfBiYWxM1Ba68vh8hmjOiAAslRcma6jyUujRwEjbA17ew5EicYN0PRAiaZ5fOjt+/ZBh
	8qvjyC+SLoSKhc2aWScHbgHcB2Jjf0ufBhmKIWGupwc8tZ0UYausUcdmzgZP3raRKHiMqk/wFDM
	8QPxZRoYZesYJIR5mw89/p5GRS+QJbk40IJ0XHTvEdB01ZZ8A9tXKxhivOVook6L/pFHeI9Jhls
	=
X-Received: by 2002:a17:902:e88d:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-27cc817bfbdmr43805375ad.61.1758653209256;
        Tue, 23 Sep 2025 11:46:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy1SkDJOZA3CAKwuSsCfToDwgbbK7v05cIFKC7xdzDXHYsuhMJBqP+fFm99qAULjSJHLnW4A==
X-Received: by 2002:a17:902:e88d:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-27cc817bfbdmr43805105ad.61.1758653208724;
        Tue, 23 Sep 2025 11:46:48 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.230.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980336511sm169112735ad.124.2025.09.23.11.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 11:46:48 -0700 (PDT)
Message-ID: <6b8271ea-282f-4900-a5ab-622c4eb85dbd@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 00:16:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i3c: scanning for i2c client devices on the network
To: Boris Staletic <bstaletic@axiado.com>, Frank Li <Frank.li@nxp.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810> <aMwT9S92IpIOT_Gq@axiado.com>
 <aNE2aAxJzo2edoRm@axiado.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <aNE2aAxJzo2edoRm@axiado.com>
X-Proofpoint-GUID: jRmBJRl7MmDnW_VoLoFbifgGXRazUALH
X-Proofpoint-ORIG-GUID: jRmBJRl7MmDnW_VoLoFbifgGXRazUALH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX6zcTnqJeErdP
 2aLK/Oux28jiadW1qopien3LJ3IN2kwcdWGMYdZq9XMxG6951yb5A58kK3B3lgB9wKwcBIhj71T
 K+PY62eO5+xr8u0Ob6QegmkRemY/s7AWpdOuH0Or7JQa1+D1L/U94jMgawQTWMCSMMz/Lx8xIlv
 0A7vvxt2RqHghkxxh0HZOHSJu6o2N9b2U4dbLtMdPPGxXgwhbvgtNGsqg7lAoRlMlE8qj7RdxvR
 RV7nJP+e8RwIKzvzGYkDfqSPlQNX5DONwzTPSilg3Rr4+HnBtZtI/1dTSLuyVBqUW1Ac/UKFzEi
 DjYTfO9r5TFbj9IQaTkpzDajeTV/N8zEYaXleYYQ8NcgvlRKg57eG5Gq5j5S3PCWbXYWCLXn1Vt
 EsKT4XPR
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d2eb1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=XYGdmzshwu/twMpVUZZNOg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=440cDlBIAAAA:8
 a=lVt5sBClby9g6MavzOgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_114652_477911_574F3DD0 
X-CRM114-Status: GOOD (  44.41  )
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

Hi Boris, Frank,

On 9/22/2025 5:13 PM, Boris Staletic wrote:
> On Thu, Sep 18, 2025 at 04:15:17PM +0200, Boris Staletic wrote:
>> On Tue, Sep 16, 2025 at 01:08:44PM -0400, Frank Li wrote:
>>> On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
>>>> Hello,
>>>>
>>>> We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
>>>> of using i2c-utils to communicate with the I2C slave from userland.
>>>>
>>>> With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
>>>> All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
>>>> I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
>>>>

Checked both .master_xfer() function registered for pure i2c controller 
and for i3c controller.

I2C controller provides full implementation of .master_xfer() function 
from vendor driver, whereas for i3c controller, framework  first 
validates if any i2c devices with the passed address is already 
registered or not ?

To suggest at i3c_master_i2c_adapter_xfer() - what's wrong if 
i3c_master_find_i2c_dev_by_addr() returns NULL ? can we not continue 
instead of returning -ENOENT ? If slave is not present, than we get NACK 
else continue to perform  master->ops->i2c_xfers() ?

This is just my thought, I may be wrong. Please point me if i am missing 
any fundamental from I3C specs.

>>>> Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
>>>> with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
>>>>
>>>> - i3c_master_controllr's i2c_adapter needs to have its class member set.
>>>> - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
>>>>    - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
>>>>
>>>> That much was enough to get i2c_detect to work with an I3C master.
>>>> To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
>>>> In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
>>>>
>>>> Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
>>>
>>> Generally, it is the same as I2C. just send out address, and check if target
>>> ACK/NACK this address.
>>
>> Are you referring here to i2c_new_scanned_device? If so, that also, in
>> my testing, couldn't detect any devices without modificatioins.
>> The failure to scan happens because:
>>
>> - i2c_new_scanned_device calls i2c_default_probe, which calls
>>    i2c_smbus_xfer.
>> - that eventually gets to i3c_master_i2c_adapter_xfer, which looks up
>>    existing devices by calling i3c_master_find_i2c_dev_by_addr.
>> - i3c_master_find_i2c_dev_by_addr returns NULL
>> - i3c_master_i2c_adapter_xfer then returns -ENOENT, ven before trying to
>>    communicate over the wire.
>>
>> I am probably missing something, because, as far as I can tell, neither
>> i2c_detect, nor i2c_new_scanned_device can currently be used with an I3C
>> master.
>>
>> Would you mind elaborating more on the suggested approach?
>>
> 
> Replying here to post the diff of what I have tried (and attempted to
> explain the opening email). Hopefully it will make it clearer what
> is our need and (more so) what my attempted solution does.
> 
> -------------------------------------------------------------
> 
> This change allows I3C master drivers to trigger I2C slave detection
> by i2c slave drivers, leveraging the existing i2c_detect mechanism.
> ---
>   drivers/i2c/busses/Makefile     |  1 +
>   drivers/i2c/busses/i2c-axiado.c | 53 +++++++++++++++++++++++++++++++++
>   drivers/i2c/i2c-core-base.c     | 12 +++++++-
>   drivers/i3c/master.c            |  1 +
>   4 files changed, 66 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/i2c/busses/i2c-axiado.c
> 
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 04db855fdfd6..7b51df1433c4 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
>   i2c-at91-y			:= i2c-at91-core.o i2c-at91-master.o
>   i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+= i2c-at91-slave.o
>   obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
> +obj-y				+= i2c-axiado.o
>   obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
>   obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
>   obj-$(CONFIG_I2C_BCM_IPROC)	+= i2c-bcm-iproc.o
> diff --git a/drivers/i2c/busses/i2c-axiado.c b/drivers/i2c/busses/i2c-axiado.c
> new file mode 100644
> index 000000000000..d5006e250a3d
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-axiado.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * I2C bus driver for the Cadence I2C controller.
> + *
> + * Copyright (C) 2009 - 2014 Xilinx, Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/reset.h>
> +
> +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, I2C_CLIENT_END };
> +
> +static int ax_i2c_detect(struct i2c_client *client, struct i2c_board_info *info)
> +{
> +	int byte = i2c_smbus_read_byte_data(client, 0);
> +	if(byte < 0)
> +		return -ENODEV;
> +	strscpy(info->type, "axiado-client", I2C_NAME_SIZE);
> +	return 0;
> +}
> +
> +static const struct of_device_id ax_i2c_of_match[] = {
> +	{ .compatible = "axiado,ax300",},
> +	{ /* end of table */ }
> +};
> +MODULE_DEVICE_TABLE(of, ax_i2c_of_match);
> +
> +
> +static struct i2c_driver ax_i2c_drv = {
> +	.driver = {
> +		.name  = "axiado",
> +		.of_match_table = ax_i2c_of_match,
> +	},
> +	.detect = ax_i2c_detect,
> +	.address_list = normal_i2c,
> +	.class = I2C_CLASS_HWMON
> +};
> +
> +module_i2c_driver(ax_i2c_drv);
> +
> +MODULE_AUTHOR("Boris Staletic axiado-2532@axiado.com");
> +MODULE_DESCRIPTION("Axiado I2C bus driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ecca8c006b02..231c43cf657d 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2467,13 +2467,22 @@ static int i2c_detect_address(struct i2c_client *temp_client,
>   		return 0;
> 
>   	/* Make sure there is something at this address */
> -	if (!i2c_default_probe(adapter, addr))
> +	temp_client->dev.bus = &i2c_bus_type;
> +	temp_client->dev.type = &i2c_client_type;
> +	temp_client->dev.parent = &temp_client->adapter->dev;
> +	dev_set_name(&temp_client->dev, "i2c-temp-client");
> +	int err3 = device_register(&temp_client->dev);
> +	int err2 = i2c_default_probe(adapter, addr);
> +	if (!err2) {
> +		device_unregister(&temp_client->dev);
>   		return 0;
> +	}
> 
>   	/* Finally call the custom detection function */
>   	memset(&info, 0, sizeof(struct i2c_board_info));
>   	info.addr = addr;
>   	err = driver->detect(temp_client, &info);
> +	device_unregister(&temp_client->dev);
>   	if (err) {
>   		/* -ENODEV is returned if the detection fails. We catch it
>   		   here as this isn't an error. */
> @@ -2542,6 +2551,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>   		dev_dbg(&adapter->dev,
>   			"found normal entry for adapter %d, addr 0x%02x\n",
>   			i2c_adapter_id(adapter), address_list[i]);
> +		memset(&temp_client->dev, 0, sizeof(temp_client->dev));
>   		temp_client->addr = address_list[i];
>   		err = i2c_detect_address(temp_client, driver);
>   		if (unlikely(err))
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2ef898a8fd80..5fabba14de20 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2494,6 +2494,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>   	/* FIXME: Should we allow i3c masters to override these values? */
>   	adap->timeout = 1000;
>   	adap->retries = 3;
> +	adap->class = 1;
> 
>   	id = of_alias_get_id(master->dev.of_node, "i2c");
>   	if (id >= 0) {
>> Thanks in advance,
>> Boris Staletic
>>
>>>
>>> Address 7E, REPEAT START, scan's address. ACK/NACK STOP.
>>>
>>> Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
>>> way.
>>>
>>> send 7E to avoid IBI during you send out address.
>>>
>>> Fank
>>>
>>>> The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
>>>> I'd welcome any sort of feedback.
>>>>
>>>> Thanks,
>>>> Boris Staletic
>>>> --
>>>> linux-i3c mailing list
>>>> linux-i3c@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-i3c
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
