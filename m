Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46259C54E67
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Mar 2024 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba5ROsZIl6ObyAmhgRTd9tFhXb1QdKM1smy5MChcIa8=; b=bR4QpV0bGJONBM
	FG4lXYwc+yUr3ldpaZJxJb27CMNjuMhwwMyznkTlKVB6BoXwBs+NBxQJf4t6EBxRYq/eEPxKd434R
	bQETuyqhCQJNulRzpL8CExeZKV4pfrcNgwHAyFN30zttGVL7RmTMHd4XJ4wPvSOWSR5StxuRwV4tr
	9nXy5xVfADXQAdJcGaobKyJmM/mTYv/AqZLrPGzOYX90IUiZ1Mh4wFsqxepfSXuD1dAjOYYp2byhQ
	CPwE6GRv8//ua5kL7G3JpO5sWiutY446cw9hSFJ5yIB6cE7f7anxTsKdaBNJZ/tKf5V9TxnVfAb/k
	MEzSu8AWOydClXdyg5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7tS-00000000N5x-1ySq;
	Fri, 15 Mar 2024 13:46:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7tP-00000000N5S-38Zq
	for linux-i3c@lists.infradead.org;
	Fri, 15 Mar 2024 13:46:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42FDkUvg020529;
	Fri, 15 Mar 2024 13:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=e+IGmJBXKrtrKOajkQ3GI6SOU3R9/vNYo9L9+B2UR3Y=; b=Yw
	5zsOUiccSnMwdnSIM3imRPfxlL31npZY8vGi3zhnOHmU5j2AgbeA4NuEc3LqftGW
	KKHpYqAKs0j3YFyODKPtjuFViOFTSvnFymCHJoZcN+fYnFThT+ciZ8nNzkegShqb
	zhxUJt/EumTCOhFzdETSnFH9w1kprjT4jwy8leQDUbPJTv8QH4ZHNbc3F97QM1T5
	i8Z5VMPoJVCPDWLjii6Q6qzdqfrKLxJWpLYq8cH8OVHs0ggGgG6AL7fjrjrks/8b
	w2wyTVNliUlCUvMiL4/YeEJiORKcJ8BqN9JyTmTiqSk6uIs/jD/QPx3+MagoAudu
	zvOO0htbDL+PhzEEoamQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wva0819h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 13:46:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FDkTEO000380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 13:46:29 GMT
Received: from [10.216.5.181] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Mar
 2024 06:46:11 -0700
Message-ID: <df221ae0-bfce-45dd-a6a4-486f3b3b3a77@quicinc.com>
Date: Fri, 15 Mar 2024 19:16:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i3c: master: Enable runtime PM for master controller
Content-Language: en-US
To: Joshua Yeong <joshua.yeong@starfivetech.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "andersson@kernel.org" <andersson@kernel.org>,
        "vkoul@kernel.org"
	<vkoul@kernel.org>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
References: <20240228093407.4038399-1-quic_msavaliy@quicinc.com>
 <b61f5f4a-7931-411d-9519-bbff1b7fd6f9@quicinc.com>
 <SH0PR01MB08419B8683E8F2DD05A791BBF928A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <SH0PR01MB08419B8683E8F2DD05A791BBF928A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _cKrxSJkhZOQC5FkGkc0nQ6UWTjTweX_
X-Proofpoint-GUID: _cKrxSJkhZOQC5FkGkc0nQ6UWTjTweX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064640_021426_283A011B 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Joshua,

On 3/15/2024 1:35 PM, Joshua Yeong wrote:
> 
> 
>> -----Original Message-----
>> From: linux-i3c <linux-i3c-bounces@lists.infradead.org> On Behalf Of Mukesh
>> Kumar Savaliya
>> Sent: Monday, March 11, 2024 1:30 AM
>> To: alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Cc: andersson@kernel.org; vkoul@kernel.org;
>> manivannan.sadhasivam@linaro.org
>> Subject: Re: [PATCH v1] i3c: master: Enable runtime PM for master controller
>>
>> A Gentle reminder ! As i was not part of the linux-i3c group before raising this
>> gerrit, might not went into right folder.
>>
>> On 2/28/2024 3:04 PM, Mukesh Kumar Savaliya wrote:
>>> Enable runtime PM for i3c master node during master registration time.
>>>
>>> Sometimes i3c client device driver may want to control the PM of the
>>> parent (master) to perform the transactions and save the power in an
>>> efficient way by controlling the session. Hence device can call PM
>>> APIs by passing the parent node.
>>>
>>> Here, I3C target device when calls pm_runtime_get_sync(dev->parent)
>>> couldn't invoke master drivers runtime PM callback registered by the
>>> master driver because parent's PM status was disabled in the Master
>>> node.
>>>
>>> Also call pm_runtime_no_callbacks() and pm_suspend_ignore_children()
>>> for the master node to not have any callback addition and ignore the
>>> children to have runtime PM work just locally in the driver. This
>>> should be generic and common change for all i3c devices and should not
>>> have any other impact.
>>>
>>> With these changes, I3C client device works and able to invoke master
>>> driver registered runtime PM callbacks.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>>    drivers/i3c/master.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c index
>>> 3afa530c5e32..a3dc88974f92 100644
>>> --- a/drivers/i3c/master.c
>>> +++ b/drivers/i3c/master.c
>>> @@ -13,6 +13,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <linux/list.h>
>>>    #include <linux/of.h>
>>> +#include <linux/pm_runtime.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/spinlock.h>
>>>    #include <linux/workqueue.h>
>>> @@ -2812,6 +2813,10 @@ int i3c_master_register(struct
>>> i3c_master_controller *master,
>>>
>>>    	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
>>>
>>> +	pm_runtime_no_callbacks(&master->dev);
>>> +	pm_suspend_ignore_children(&master->dev, true);
>>> +	pm_runtime_enable(&master->dev);
>>> +
> 
> Will runtime pm impact on ibi request from target?
Don't think so. This change just enables target device driver to call PM 
apis and control the transfers under RT resume and RT suspend.
IBI comes asynchronously to the master driver and it should get handled 
accordingly. .
> 
>>>    	/*
>>>    	 * We're done initializing the bus and the controller, we can now
>>>    	 * register I3C devices discovered during the initial DAA.
>>> @@ -2849,6 +2854,7 @@ void i3c_master_unregister(struct
>> i3c_master_controller *master)
>>>    	i3c_master_i2c_adapter_cleanup(master);
>>>    	i3c_master_unregister_i3c_devs(master);
>>>    	i3c_master_bus_cleanup(master);
>>> +	pm_runtime_disable(&master->dev);
>>>    	device_unregister(&master->dev);
>>>    }
>>>    EXPORT_SYMBOL_GPL(i3c_master_unregister);
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
