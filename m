Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F04C28B20
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Mar 2025 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDV+V0Je8+QaoIQgpvdE4eNYtA/9aO7muPM+8UYt97M=; b=MZMEWvtp9dBsMm
	KMVQOwpb57y/GtSlZiNjg8cB+1Twv6JWhhaZBT5PFBwHozJlCsZbmsP+qosKibUuOhmagU3OECECG
	AVZY4iCK8Bfbx+Adnvv4KOYKnwIkkf9FtieyWkwjQL5KTDYdt8/pUuMnd9OVU4JbgrRQKA7Jj9FH5
	T1vvqJeObXMzrieRJkRiYva4ANbrp881zSZkGyht0ys3hJvF1cD0k3U1a4Qg5VVtJQlL5ICNdLvq6
	50Z6TYZSZRWsNT3prJGFcWcD30jVE/JCw+euQ9rtqvtYFWnAsgu+lMxSIG/s1jYla6zwXZD4+vxk6
	OvD8/ObjegeIYjyavwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB9G-0000000DfpT-2DGn;
	Fri, 28 Mar 2025 14:57:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAhK-0000000DbGW-1VS8
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 14:28:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCikLh022987;
	Fri, 28 Mar 2025 14:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	438DhNZ05KwVshF9P4RUqwDcueNpXHFr3UiwiRemnVU=; b=atWt/YJSJ8URIPtO
	SIyojY9uEIKXfRLFfLWjIwtYqdk1RzD5LmF09ArlwIjhCBPDDjQMXqqCWtyLLoUP
	uHewhZQy4Yp2HmQXTB6aApBxz/qc8yBeflz5C4+am7YQ7oie6ZIVqTvHlQHOtJpC
	IMU539p0BQCULBnY4gYEsFvdaZMyHoa2x/0gzPI3Npofh0U0gxTRFEWFxxIchc9S
	mF441RdwsDrQvtJVeWMVt6ag6L2nGhc2GKCfsIysvQyfiQY0BNOhePp8BMacSmJX
	8v1Y/jIDtW1T0XGYCojKykvMckioG3+BXCjD/5N8F4WPRfWVQV8npd2aIwTme2iE
	atWYGQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9n0nf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:28:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SESSTE019428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:28:28 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 07:28:24 -0700
Message-ID: <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
Date: Fri, 28 Mar 2025 19:58:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e6b20d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=5eQAFPGMPv0r9lWwo7AA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _4GjxYER2b84M2x5YRuUkOF-X6YI2T07
X-Proofpoint-ORIG-GUID: _4GjxYER2b84M2x5YRuUkOF-X6YI2T07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072838_543776_AD09FA37 
X-CRM114-Status: GOOD (  19.38  )
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

Thanks Krzysztof for immediate review !

On 3/26/2025 7:53 PM, Krzysztof Kozlowski wrote:
> On 26/03/2025 15:16, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../bindings/i3c/qcom,i3c-master.yaml         | 60 +++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
>> new file mode 100644
>> index 000000000000..af6b393f2327
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
> 
> Naming: nothing improved.
> 
Sorry, i didn't get exactly. To your comment "Filename matching 
compatible." i have Changed the compatible string to "qcom,i3c-master" 
and now it's matching to file name.

shall i make filename as qcom,i3c-master-qcom.yaml ? If this is wrong, 
please suggest.

Removed "bindings" from the subject line too. I have removed "master" 
from the description, shall i remove from subject also and keep only 
controller ? I kept master controller thinking it may be good as "master 
controller" instead "controller".


>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Geni based QUP I3C Controller
>> +
>> +maintainers:
>> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> +
>> +description:
>> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
>> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
>> +  hotjoin, IBI mechanism.
>> +
>> +  I3C Controller nodes must be child of GENI based Qualcomm Universal
>> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
>> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
>> +
>> +allOf:
>> +  - $ref: i3c.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,i3c-master
> 
> And this got worse. It makes also no sense either: how can you claim
> that this covers all possible future I3C masters from Qualcomm?
> 
> What was the resolution of previous discussion?
>
Below was my understanding and reply.
"
I think i should remove const. kept it for now as no other compatible to 
be added as of now.
let me remove const.
SoC name is not required, as this compatible is generic to all the SOCs.
"

But i realized i missed to remove const, sorry for that.


I have also checked for qcom,spi-geni-qcom.yaml, it has below :
properties:
   compatible:
     const: qcom,geni-spi

Let me know if i can correct for SPI in separate new patch ?

> Best regards,
> Krzysztof
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
