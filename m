Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F1DC02198
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Feb 2025 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3fiiHuia6wm1DeBI7zeoa61qAwwLkcdLd4b6QNDlWI=; b=falxN+i4ZHt7L7
	PKR1mrR38fTtYgfWqL9YEZqdOh/fKR/3stq0r2p4Z11noVm2B7cp3k8bUvun+wCY6Pxta9mOA6Os2
	Tpv0xLJTxukHg7quVMghv2AVbqt9XgY9IF6TL4BP3OGaeDU01vp11Oc43eSYXkkDcdj+dqxXGOubA
	9Hcrf7MBz39A4rx8gVd+1Ro+ub0p0ldPzp7B21lfKRgVqfr6Tmp73FsTdfa8EoTRSzAAKuhX5w/w8
	K7Do/fJV9pPd1bCmAdr78RytZkEx0DUmMKwT1HrdSvsixcrs/zGXdTnKRG5s+h7RDxk+aK1Ojgt0T
	Lmg1AdgKe1rTbNisJBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIR2-00000008dt3-3ipF;
	Wed, 12 Feb 2025 19:30:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIR1-00000008dsa-0nEI
	for linux-i3c@lists.infradead.org;
	Wed, 12 Feb 2025 19:30:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CHmXuQ008940;
	Wed, 12 Feb 2025 19:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbViyHr4HUyzndKcRL6rVCmA2akW3awY7n9ZNgIvpW8=; b=bruTrFcuVh26B5BS
	GeK4MkItxtAAFHZhmEaxqGyx/7J/cdldB0Hc61SRLlhzlq9vi4GMEbPiwOoX9twx
	nQv7IFOKHFA3SSdnc8WJRI0S4RJ+SiGRGszQQzgwi14Gq7B6309wTx83SatRzbkP
	+otGKYS2padPwNVUWfjBZ7TrTQvLt+nRgo07o/5b6m/KRzOIufbPa1t+H/70O893
	IHY4xZmSV96jFqwXY9p9eOodqaWbcqh2PwRlvQV9+AuTTVEgBjnyx7Vdu3bFM0Li
	YJ+JfwWyBKyZl9C7/ocbOVuCyRLeQ4BVrI/RRRiA3VvRo6WvlHbWGBistrLDo6s9
	7QpQcw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qsq97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:30:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CJU4w0011168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:30:04 GMT
Received: from [10.216.10.30] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 11:30:00 -0800
Message-ID: <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
Date: Thu, 13 Feb 2025 00:59:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
 <20250211214128.GB1215572-robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250211214128.GB1215572-robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YpFZhfbwHAwty72EciwSvKZwnmzTcl6W
X-Proofpoint-ORIG-GUID: YpFZhfbwHAwty72EciwSvKZwnmzTcl6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113011_253693_F822E273 
X-CRM114-Status: GOOD (  13.66  )
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

Thanks a lot Rob ! sorry, i was late to respond on this while waiting 
for other comments agreements.

On 2/12/2025 3:11 AM, Rob Herring wrote:
> On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
>> Thanks Krzysztof !
>>
>> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
>>> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>>>
>>>>> You never tested your DTS or this code... Drop
>>>>>
>>>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
>>>
>>>
>>> And how is it supposed to work? Are you going to send us your local
>>> internal DTSI? Is it going to pass any checks?
>> was saying about code was testing with MTP. DTS was tested using dt-bindings
>> check.
> 
> make dtbs_check is how you test.
Sure, we are running "make dt_binding_check 
DT_SCHEMA_FILES=qcom,i3c-master.yaml"
> 
>> I should add "se-clock-frequency" and "dfs-index"
> 
> No. We already have standard clock properties and we don't put indexes
> into DT.
> 
Okay, sure Rob. I shall remove both of these and set internally within 
driver as they can be set to default.
> Rob


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
