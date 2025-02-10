Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE73C02198
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Feb 2025 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ul5jwuz+Z9tneWlcAmLVUJjGPKJkzhmD1pKGuib1Q0=; b=iWDgQP8eiQrDkCo+1A+mQQLCZ+
	VI6OV3XFlCHi8mqSyrttmKmyUz/7+5QTrq/ZCmvEl2u3+7snDy8/ra8I8nGtkeGXJZop0BPl63+sO
	dOwciR8XNgfgn3faHA6Ub2ZxdZ0KP64Vhdq3JScVvjbtyGljnxkcq+VOjxz2CEm7tWMSEsIf8N128
	zTF8bJWtG7846jYa9d52YqGqi9d6Ja6qPeufxfCg56rK3OtFS1GGBt8qsuXXjrYYM35uFDQVijIYH
	jvgaOSE2J7yb62OxqG6yPmjInk3hpTl6oD4nCjjda1HxiV66Fo4yqJA+gM6LK/vngHltDi0HSiCJ9
	YdVOcDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOO-00000000SMY-1eWt;
	Mon, 10 Feb 2025 16:12:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOL-00000000SLT-41ea
	for linux-i3c@lists.infradead.org;
	Mon, 10 Feb 2025 16:12:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9VnLO008240;
	Mon, 10 Feb 2025 16:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O5ZxRsXEL8Qchx184ZcGzMA0kX4PWaNwQG5mQFjUeoE=; b=a8st6Q1r25GWrnSc
	xozoT11J4mP2J2Xi7C2YUr6BiYRIBePeuIvPBNuha7Atgwa3ZaxeHVO0gnEtRK8o
	clL0VkaLrBB8qf4zMQ0kWtFvO8Ripsr0ah7+NF3FGRuoc9aZSdg13FmWp8fseVp9
	XFNaRfIQxI+c67ew/Dz5m5L1ubYiGWA68b+sSqpUOji3ICd38sl07aBslyVODRMN
	/Olc/45cpZUrVqnK+q0/X9F6z6IWVgieyjt/FiKOPAjP5vJ5YB5rkH2v4KkxvZ0l
	Z6rlFbQbFiM4P/RswkmHYHJasLgWk2zidP1UTSQEe5uC8piMw8hB5OJlmPAPycnW
	E9lLFA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh125h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGC748027796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:07 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:12:03 -0800
Message-ID: <b7f2c973-e161-4b83-9b3a-415e84510bd2@quicinc.com>
Date: Mon, 10 Feb 2025 21:42:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
 <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <7c518972-75df-4c8a-8920-06d5aa2849ae@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gkd_6w2BDitqy_n_GmJ5g7ai6toF7e7X
X-Proofpoint-GUID: gkd_6w2BDitqy_n_GmJ5g7ai6toF7e7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081214_020924_92EC0722 
X-CRM114-Status: GOOD (  23.74  )
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

Thanks Krzysztof !

On 2/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
> On 06/02/2025 14:43, Mukesh Kumar Savaliya wrote:
>> Hi Krzysztof,  Thanks !
>>
>> On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
>>> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>>>> Add device tree bindings for the Qualcomm I3C master controller. This
>>>> includes the necessary documentation and properties required to describe
>>>> the hardware in the device tree.
>>>
>>> A nit, subject: drop second/last, redundant "bindings". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>> Sure
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>>> Use modern terminology, which means:
>>> s/master/whatever else or even nothing/
>>> See other recent bindings and discussions.
>>>
>> Sure
>>>
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>>    .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
>>>>    1 file changed, 57 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>> new file mode 100644
>>>> index 000000000000..ad63ea779fd6
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>>
>>> Filename matching compatible.
>>>
>> Changed compatible to "qcom,i3c-master"
>>>> @@ -0,0 +1,57 @@
>>>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm I3C master controller
>>>> +
>>>> +maintainers:
>>>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: i3c.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,geni-i3c
>>>
>>> No SoC? So to be sure: you claim all future SoCs will be using exactly
>>> the same interface. No new compatibles, no new properties will be added.
>>>
>> I think i should remove const. kept it for now as no other compatible to
>> be added as of now.
>>
>> let me remove const.
> 
> No, it does not matter. Keep const.
> 
Sure. I reviewed other files and seems i should write as below. Please 
help confirm.

   compatible:
     items:
       - enum:
           - qcom,sm8550-i3c-master
       - const: qcom,i3c-master
>>
>> SoC name is not required, as this compatible is generic to all the SOCs.
> 
> That's the statement you make. I accept it. I will bookmark this thread
> and use it whenever you try to add any future property here (to be
> clear: you agree you will not add new properties to fulfill *FUTURE* SoC
> differences).
> 
Sorry, i am not saying there won't be any other compatible but i was 
saying base driver will use "qcom,i3c-master".
After checking other files i realized there can be const compatible but 
other SOC specific can be added as enum.  Hope above given way is fine.


>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>
>>> Drop
>>>
>> Not required ? I see other bindings are using it, so please confirm if i
>> can remove this.
>>>> +    maxItems: 2
>>>
>>> Drop and instead list and describe items
>>>
>> Okay, i can remove maxItems if not mandatory. Taken cdns,i3c-master.yaml
>> and added these.
>>
>>>
>>>> +
>>>> +  clocks:
>>>> +    minItems: 1
>>>
>>> Look at other bindings. There is never code like this.
>>>
>> cdns,i3c-master.yaml taken as reference.
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: se-clk
>>>
>>> Drop clock-names
>> Sure, took reference from cdns,i3c-master.yaml.
>>>
To confirm, i should drop complete clock-names and items too right ?

>>>> +
>>>> +  interrupts-extended:
>>>> +    minItems: 1
>>>> +    maxItems: 3
>>>
>>> As well - there is never an interrupts-extended property. Just interrupts.
>>>
>> No, i see this property many places. Do you mean to say
>> interrupts-extended  can be there in examples but not only add
> 
> I already wrote what you should do:
> 
> "Just interrupts."
> 
Sure, Changed interrupts-extended to interrupts. Done.

>> "interrupts" property here ?
>> e.g timer/riscv,timer.yaml +41 lists it in yaml also.
> 
> 
> Please do not take one file and create coding style out of it, but
> instead look what ~2300 other YAML files do.
> 
> 
I tried to look other many files including i2c and added. Please review 
latest or correct me before v2.

> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
