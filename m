Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A05C369A2
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOdoh0r4Gk/TWJdfUXyr094QqwTDFBLXL8wB+YFEzZc=; b=1tcViSMPeDah7I
	XZ4zWgk5sjNXzVdg2EwKMACbVKVWmcmzkZRDMDYckQJVpyHonxMQYjsIKTrng+VDdEops+y3czBgh
	VGApwDj0jjOq+/yyqtseBZvKQqle5/8Fes/ldoiOEYS7LMJZ92IwtIWMJde8p0FhE/CnmCeS8+PAg
	RiTK+Mv1Lcg4LgsXTtQm5wtCyWUq8I7QcIFKNg/XAuVM4Mt05SUDDSK40oQsO3fKMA3vwtegieULS
	vx4hryDxfE5iMXHxHa5eLonMdh4RiCIN9YcwclQwxZRNHm9NAb70MqwWztQ2pJZne7BacbxSxqlWG
	1u+2XBdwLkDkea7ZaTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OJG-00000006BhT-07tP;
	Wed, 09 Apr 2025 05:49:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OJE-00000006Bgz-0MV2
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 05:49:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZem7011629;
	Wed, 9 Apr 2025 05:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovsg1QF8xQXaSQIpASLIOR/7BlVQMkeqc0GKLgadWWw=; b=LfCvLzdN/zncPJ5k
	eDJl+aEnQrr4nwizG4NdbVf9Y/bg+xoAxATEL2+5tC7CQQLLlM1WTnLd31WDIHaa
	6/QXZsYoT7OnxZeae7MbdoWWu7olejUx/dsE6tMwpaw5J1y4Hr1ACGznYHcWPfNu
	Lcdrh/TiFFhc1JaNZlDJOAMEP02/Y9U1Qs9HDA4DFRai8F0GXK0rh1dblK/MkubZ
	GuqyG8VqLjMhUcDcI/K1P7IYd1X4hOmHjvQH+TmzloT1/ietjvD9n5wJEzb9usby
	kInspd1x+1/laWneEJbMpeY5IbJs0rukJm5oQw98j9a2fcsWbVE0z3pyOIH2mZEb
	EclwfQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftj2g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:49:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5395n56L001254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 05:49:05 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 22:49:01 -0700
Message-ID: <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
Date: Wed, 9 Apr 2025 11:18:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
 <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f60a51 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=9noXzk69sv193lEOhfoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: R7jrNI3Zn3z8QFV1UoGmI9KPfZ17VsXq
X-Proofpoint-ORIG-GUID: R7jrNI3Zn3z8QFV1UoGmI9KPfZ17VsXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_224912_173608_285E7336 
X-CRM114-Status: GOOD (  26.83  )
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

Hi Krzysztof,

On 4/9/2025 12:11 AM, Krzysztof Kozlowski wrote:
> On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>>> +
>>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>>> +{
>>>
>>> You miss sparse/lockdep annotations.
>>>
>> This is called in pair only, but to avoid repeated code in caller
>> functions, we have designed this wrapper.
>> i3c_geni_runtime_get_mutex_lock()
>> i3c_geni_runtime_put_mutex_unlock().
>>
>> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
>>
>> Does a comment help here ? Then i can write up to add.
> 
> I do not see how this is relevant to my comment at all.
> 
What i understood is you suspect about lock/unlock imbalance right ?
I know that Lockdep annotations will be used to check if locks are 
acquired and released in a proper order.

You want me to add below code in both the functions mentioned ?
     lockdep_assert_held(&gi3c->lock);

What exact sparse/attribute can be added ? I am not sure about that.
>>
>>>> +	int ret;
>>>> +
>>>> +	mutex_lock(&gi3c->lock);
>>>> +	reinit_completion(&gi3c->done);
>>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>>> +		/* Set device in suspended since resume failed */
>>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>>> +		mutex_unlock(&gi3c->lock);
>>>
>>> Either you lock or don't lock, don't mix these up.
>>>
>> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock()
>> if this failed.
> 
> 
> I do not see how this is relevant to my comment at all.
> 
same as above
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>>> +{
>>>
>>> Missing annotations.
>>>
>> Shall i add a comment here ?
> 
> Do you understand what is sparse? And lockdep?
> 
Little but not clear on exact sparse attribute to be added. please help 
me. if you can help with some clear comment and sample, will be easier 
if you can.

Lockdep : Helps with runtime check if lock, unlock are proper.
sparse: attributes /special comments to add which helps with static 
analysis which is not done by the compiler.
>>>> +	pm_runtime_mark_last_busy(gi3c->se.dev);
>>>> +	pm_runtime_put_autosuspend(gi3c->se.dev);
>>>> +	mutex_unlock(&gi3c->lock);
>>>> +}
>>>> +
>>>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>>>> +{
>>>> +	unsigned long time_remaining;
>>>> +	unsigned long flags;
>>>> +
>>>> +	reinit_completion(&gi3c->done);
>>>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>>>> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>>>> +	geni_se_abort_m_cmd(&gi3c->se);
>>>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>>> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>>>> +	if (!time_remaining)
>>>> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
>>>> +}
>>>
>>> ...
>>>
>>>> +
>>>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>>>> +	if (IS_ERR(gi3c->se.base))
>>>> +		return PTR_ERR(gi3c->se.base);
>>>> +
>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
>>>> +	if (IS_ERR(gi3c->se.clk))
>>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>>>> +							"Unable to get serial engine core clock: %pe\n",
>>>> +							gi3c->se.clk);
>>>
>>> Totally messed indentation.
>>>
>> yes, corrected.
>>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Set the bus quota to a reasonable value for register access */
>>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
>>>> +	gi3c->clk_src_freq = KHZ(100000);
>>>
>>> And why can't you use clk_get_rate()?
>>>
>> During probe(), we need one time initialization of source clock
>> frequencey. HW has no clock set before this.
> 
> How is it possible that there is no clock or clock was not configured
> but you need to know it? Anyway, it's tiring to keep discussing this.
> 
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int geni_i3c_probe(struct platform_device *pdev)
>>>> +{
>>>> +	u32 proto, tx_depth, fifo_disable;
>>>> +	struct geni_i3c_dev *gi3c;
>>>
>>> Just store pdev->dev in local dev variable, to simplify everything here.
>> yes, thats right. But i see other drivers are using same pdev->dev. Is
>> it fine ? if really required, will change it.
> 
> Are you going to discuss every little comment? And come with arguments
> like "I found poor code, so I am allowed to do the same"?
> 
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
