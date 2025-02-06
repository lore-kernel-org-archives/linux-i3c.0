Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CAFC02194
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Feb 2025 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfD+0Pej9QKbT1NAHSTVapoBvPMpM7pxGDvLIK4XF/M=; b=2Kzq3657iMxpBUSED6GLsLXp/1
	7BFzAnnQxBulRxo2KjOZrqKe1N99nC6zLu3qSDByGiseWLguJjJjYDf9ib0mFZo9DhcWAcNIF7ZGS
	O0/YJnQ44jOwHRUj72YSOZnbod2yncKjbDOUIQl4e8NSGvr4dyvpjTHfu7jVPolW+m6Qdd3szY6Gw
	dMOPTuKmCW6j5sB5OLNYbVzAa0oQauNA9h5TZ3BA8h0JS2IIjlYW0c4otTVzGvi/RgNiPc95E2942
	ClKmVdTrZ3e4m1EBLDyWo+RRDaoO9hOEwKQMR0TdTuLXhjIWEU3/nHy/R+X3RywC5DPqdGoqSuKcR
	W6gFoy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2PB-00000006VJR-1zsO;
	Thu, 06 Feb 2025 13:58:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Ao-00000006TLo-06mY
	for linux-i3c@lists.infradead.org;
	Thu, 06 Feb 2025 13:44:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51681Cqq028716;
	Thu, 6 Feb 2025 13:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PNr4TAmDqC70NoQ+spFCJrVGqRofaiqnhKKE2VOzxY=; b=ZrzZc8or8X2ZS19p
	0IvZVMAljWbQGfE16gPYqvF51oKb4jnLZsSs/2IV5ZhMvRZi8vNwIzKdQ8G+IWzF
	NWhmeunI61YXxX3GWaCcr5LE0i4dlsRGvc2Cpn7X5ApuyhvDOhVKGmrEteQOAmdM
	IEd2GKWEmpSDbKEvBkt42qPg+ETTW/ggUc9ZeXJ22yZVERDYNrPv+wVYh7yB+uCh
	xO4RL1JSsgw8euWxEPa82Ym1NasFeHe5SaglAzSf3PR2zeKG8YbgMwUHFqSbzK7v
	79p/5RrOttUyqPuwgVfCodAZKuKVwn5vFNiopKHzJDfrCNjoprx+09lqL771eTPV
	a/9Jjg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ms6ygu5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 13:43:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516DhwDi015754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 13:43:58 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 05:43:54 -0800
Message-ID: <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
Date: Thu, 6 Feb 2025 19:13:50 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <248000f5-63db-492c-884d-ac72db337493@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dpE2SoMtiY2Kez5LmHq2SP6heVDkbcLk
X-Proofpoint-ORIG-GUID: dpE2SoMtiY2Kez5LmHq2SP6heVDkbcLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_054406_186722_4E5BCAEA 
X-CRM114-Status: GOOD (  23.91  )
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

Hi Krzysztof,  Thanks !

On 2/5/2025 8:12 PM, Krzysztof Kozlowski wrote:
> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C master controller. This
>> includes the necessary documentation and properties required to describe
>> the hardware in the device tree.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
Sure
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> Use modern terminology, which means:
> s/master/whatever else or even nothing/
> See other recent bindings and discussions.
> 
Sure
> 
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../bindings/i3c/qcom,i3c-master.yaml         | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>> new file mode 100644
>> index 000000000000..ad63ea779fd6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> 
> Filename matching compatible.
> 
Changed compatible to "qcom,i3c-master"
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm I3C master controller
>> +
>> +maintainers:
>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> +
>> +allOf:
>> +  - $ref: i3c.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-i3c
> 
> No SoC? So to be sure: you claim all future SoCs will be using exactly
> the same interface. No new compatibles, no new properties will be added.
> 
I think i should remove const. kept it for now as no other compatible to 
be added as of now.

let me remove const.

SoC name is not required, as this compatible is generic to all the SOCs.
>> +
>> +  reg:
>> +    minItems: 1
> 
> Drop
> 
Not required ? I see other bindings are using it, so please confirm if i 
can remove this.
>> +    maxItems: 2
> 
> Drop and instead list and describe items
> 
Okay, i can remove maxItems if not mandatory. Taken cdns,i3c-master.yaml 
and added these.

> 
>> +
>> +  clocks:
>> +    minItems: 1
> 
> Look at other bindings. There is never code like this.
> 
cdns,i3c-master.yaml taken as reference.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: se-clk
> 
> Drop clock-names
Sure, took reference from cdns,i3c-master.yaml.
> 
>> +
>> +  interrupts-extended:
>> +    minItems: 1
>> +    maxItems: 3
> 
> As well - there is never an interrupts-extended property. Just interrupts.
> 
No, i see this property many places. Do you mean to say 
interrupts-extended  can be there in examples but not only add 
"interrupts" property here ?
e.g timer/riscv,timer.yaml +41 lists it in yaml also.
> Also drop constraints and list items.
> 
I will remove minItems and MaxItems, will list Items with description.
> 
> 
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
