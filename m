Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24911C02198
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Feb 2025 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTz/LgCakVKG5Dzsb8o65baQHpv0KMqLpMmq6Fj4ivM=; b=2R1L+P+jgd8DTi
	GMsBIVI74Oyp+2dFlJmohNSJWfn7hkDP3ttuoVjvEC+D+nbakf8JNI021S2yLAaAwombfc3JLD4l8
	5JRSENG+S8dmFueFgzcffm21KpS8sJoNtYQSHTEgJhnkD9+kkvk54S/DtmUk3sihvt5G27vo+umkP
	Y+odcqxBxO2BXtv9OMboRV/iq0QFhkzmiB7gQ4cyfSLrSfpqDii3QBmuCp5p/e4v/3lIXgxSp3+zi
	gEywwzFIwlMboHbcKOxWyhdjFS7zv7I9KDUpNdU4xxfL9DWNdFXujpK2fPkdzzBKAOgDqL4ZyuJ9U
	FVHxD/g7JQJLuNfg+9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDWX-00000007dQj-2o3C;
	Wed, 12 Feb 2025 14:15:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDWU-00000007dQM-3Ago
	for linux-i3c@lists.infradead.org;
	Wed, 12 Feb 2025 14:15:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8lEl2028737;
	Wed, 12 Feb 2025 14:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwXJh/CGXv0FJaW1sQ7EFOYx4LdPcBFmv7GOLkJ3gL8=; b=NrzD/pmBw5V4R3Hw
	hmD3eV+86EhC94dkfLjEaTmKA9s40Q1p/wX1A5cgkGWssYpT+FnMRJ6i9MHFsrfs
	PN6vqpye5iqTS/Z2olrcdYmKW0gICa1u//p9Zg81s3iBl9kdck10zyf0h2cx6eZp
	0jCMF6mDtOVmvlXum/ytVRVv5wMFHI3wtpf+D5M+elQICh7smX1GAiiudyY9HKZ3
	3LSXbwRXLr8slz7uldWyKQ15Ruhfv2qPiYF6uv5IncMI3pZkFxREFHqPiQkT8EkU
	C2075kKDl7gKzEFo7FZgIJVjXDt3SMQ6mTG2SN0DLc79iFvP1kKSkwIqeEmtIB2Y
	KtoaNA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9n5vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:15:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CEFIfE021226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 14:15:18 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 06:15:14 -0800
Message-ID: <6ff07b46-2c0d-41e7-9958-1525ab4da9e4@quicinc.com>
Date: Wed, 12 Feb 2025 19:45:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
 <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
 <20250211213924.GA1215572-robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250211213924.GA1215572-robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vQvWBTB4K4xxgkA2KP9g2FsvjkNJiONm
X-Proofpoint-GUID: vQvWBTB4K4xxgkA2KP9g2FsvjkNJiONm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_061530_926187_28030CA7 
X-CRM114-Status: GOOD (  23.03  )
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

Thanks Rob !

On 2/12/2025 3:09 AM, Rob Herring wrote:
> On Mon, Feb 10, 2025 at 09:42:03PM +0530, Mukesh Kumar Savaliya wrote:
>> Thanks Krzysztof !
>>
>> On 2/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
>>> On 06/02/2025 14:43, Mukesh Kumar Savaliya wrote:
>>>> Hi Krzysztof,  Thanks !
>>>>
>>>> On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>>>>>> Add device tree bindings for the Qualcomm I3C master controller. This
>>>>>> includes the necessary documentation and properties required to describe
>>>>>> the hardware in the device tree.
>>>>>
>>>>> A nit, subject: drop second/last, redundant "bindings". The
>>>>> "dt-bindings" prefix is already stating that these are bindings.
>>>> Sure
>>>>> See also:
>>>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>>>
>>>>> Use modern terminology, which means:
>>>>> s/master/whatever else or even nothing/
>>>>> See other recent bindings and discussions.
>>>>>
>>>> Sure
>>>>>
>>>>>>
>>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>>> ---
>>>>>>     .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
>>>>>>     1 file changed, 57 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..ad63ea779fd6
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>>
>>>>> Filename matching compatible.
>>>>>
>>>> Changed compatible to "qcom,i3c-master"
>>>>>> @@ -0,0 +1,57 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm I3C master controller
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: i3c.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,geni-i3c
>>>>>
>>>>> No SoC? So to be sure: you claim all future SoCs will be using exactly
>>>>> the same interface. No new compatibles, no new properties will be added.
>>>>>
>>>> I think i should remove const. kept it for now as no other compatible to
>>>> be added as of now.
>>>>
>>>> let me remove const.
>>>
>>> No, it does not matter. Keep const.
>>>
>> Sure. I reviewed other files and seems i should write as below. Please help
>> confirm.
>>
>>    compatible:
>>      items:
>>        - enum:
>>            - qcom,sm8550-i3c-master
>>        - const: qcom,i3c-master
> 
> No, that's even worse. I doubt there is some universal, never changing
> QCom I3C master.
> 
Agree, it may change. So can i go with "qcom, i3c-master" now instead of 
going SOC specific name ? The current i2c and spi qcom drivers are also 
using "qcom, geno-proto".

Since other i3c drivers using "vendor, i3c-master", i followed same.
Should i use "qcom, geni-i3c" or "qcom, i3c-master". Accordingly i can 
make next patch.

>>>>
>>>> SoC name is not required, as this compatible is generic to all the SOCs.
>>>
>>> That's the statement you make. I accept it. I will bookmark this thread
>>> and use it whenever you try to add any future property here (to be
>>> clear: you agree you will not add new properties to fulfill *FUTURE* SoC
>>> differences).
>>>
>> Sorry, i am not saying there won't be any other compatible but i was saying
>> base driver will use "qcom,i3c-master".
>> After checking other files i realized there can be const compatible but
>> other SOC specific can be added as enum.  Hope above given way is fine.
> 
> AIUI, "geni" is some firmware based multi-protocol serial i/o controller
> and we already have other "geni" bindings. So really, it's probably more
> coupled to firmware versions than SoC versions. If we haven't had
> problems with per SoC quirks with the other geni bindings, then I think
> using the same "geni" here is fine. But we won't be happy if we start
> seeing per SoC quirk properties.
> 
Yes, was trying to follow same like geni based i2c, spi.
SOC specific can come, but that would be kind of variant which may 
depend on QUP GENI HW version or FW version.
> Rob


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
