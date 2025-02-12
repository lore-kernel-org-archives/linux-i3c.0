Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9BAC02198
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Feb 2025 19:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMBVPbvD8SuFHTBF9Hy3wvh528+ajq1fckbrrG5h16Q=; b=wS90Arx5zenhL6
	BJXycjg+m/IoVfRKSOIIYg/BW4iCjWJfqTQnitUK4YYADkcWwUBm59xPGTE0CDd/4i+itr36scErc
	BveMwulXrtBP8IV5yuyCe9q6cUcY/1J+YV8xmqnkjlsYOPcUuSzlTolX/JaZmpYynp/YBAre8camd
	G3E53aD7uFtLeaAEYtOSMAX/VfxBigmgRiEcQ4t6ONxfvtHTh1dYcWLrl4547ajCI3P7y+tNpaci/
	o6Q5Z+RGWXqpsBT3iWJVfJhpWmB6fCUDiqUjI2dy1E1EZkxSdO+XSwAzA/yz1uvKNJ36AJ75sq/NJ
	2D1YU3FBq/pMAj+DrERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIlH-00000008h7f-1p2l;
	Wed, 12 Feb 2025 19:51:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIk4-00000008gpm-30xS
	for linux-i3c@lists.infradead.org;
	Wed, 12 Feb 2025 19:49:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9nHt5014145;
	Wed, 12 Feb 2025 19:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrmOzWfmrqIIZFBnsku6PH47bHCleybsQ70S0i2f8Jw=; b=bQHsgIEZdwEhdNs/
	0AHCqMrNnXKp3TLG38wXe7m9AzF/ZadQw1xWKjUC5rzoLw0056uhVDfHPUP3u5FX
	6A1KZFc53JTn2q/GOYYJteOMxgeACsP28X5SV2Qye7dJPk6ZuzFtXxWgm/Ubnr2P
	XEpvH/Qat77Uf9Avow8BM0DybvLTFjlsge13FfgWN6U2g0EmZGS8nPmvBaLQrIJ5
	pOcnCEoqLlz8xotZEST1e/3St6ef6q5wbIXrCjyepVErGRNtmX5ZwPVvRTLvoepE
	QmJVjsXiLRNaNGwNICFulkM7BD8rZmeqSiICfKa01Qo7EPTJZa/YFs+n7xwlcqDA
	oq1BYQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3wxpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:49:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CJnkbx008705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:49:46 GMT
Received: from [10.216.10.30] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 11:49:42 -0800
Message-ID: <37954fc4-27cc-4e5f-a8ef-0e7f4ac0e041@quicinc.com>
Date: Thu, 13 Feb 2025 01:19:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
 <20250211214128.GB1215572-robh@kernel.org>
 <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
 <5ae2fc10-c5fe-4400-8f15-de1fb7ef7144@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <5ae2fc10-c5fe-4400-8f15-de1fb7ef7144@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QeskENwyDzHbaTTBMiHtPPqyhSpBm00y
X-Proofpoint-ORIG-GUID: QeskENwyDzHbaTTBMiHtPPqyhSpBm00y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_114952_768558_6673F53E 
X-CRM114-Status: GOOD (  13.76  )
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



On 2/13/2025 1:09 AM, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:29, Mukesh Kumar Savaliya wrote:
>> Thanks a lot Rob ! sorry, i was late to respond on this while waiting
>> for other comments agreements.
>>
>> On 2/12/2025 3:11 AM, Rob Herring wrote:
>>> On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
>>>> Thanks Krzysztof !
>>>>
>>>> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
>>>>> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>>>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>>>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>>>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>>>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>>>>>> +		return ret;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>>>>>
>>>>>>> You never tested your DTS or this code... Drop
>>>>>>>
>>>>>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
>>>>>
>>>>>
>>>>> And how is it supposed to work? Are you going to send us your local
>>>>> internal DTSI? Is it going to pass any checks?
>>>> was saying about code was testing with MTP. DTS was tested using dt-bindings
>>>> check.
>>>
>>> make dtbs_check is how you test.
>> Sure, we are running "make dt_binding_check
>> DT_SCHEMA_FILES=qcom,i3c-master.yaml"
> 
> Hm? Please read it again. You anyway have it documented in your company
> guidebook, so I expect you follow that one *very* carefully because
> reviewers repeating the same as your company book and then repeating
> themselves three times is just too much.
> 
sorry, i will run what Rob has pointed "make dtbs_check" as it's giving 
me exact clarity what to do. I just mentioned what i was doing.
And as you pointed, will follow complete internal guide too if it's 
missing dtbs check. Thanks !
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
