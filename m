Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C92C3600C
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Apr 2025 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+ss0nffw9kA/PUlrFiPRsrk2VsRt58BHbkHPiIApS4=; b=d2QP+fcI94EZCb
	nZpjqAwU7OBmAb2JTEL0X0JaXGu6a7EENW28Ppc0aHssJ+v+y+1va92YZq5a97Rqxfq+EFVpa8hjw
	vdcAFbPuhBPculTE1hkZk5GhN/I3fYBF6ATvNKd5ZL0PpqDVGYWdX2pGQ/te8HydRuAGvxm8g8n8M
	BJASFUsWoNijK2/UnI/s4quovG6kIBbAGOGFdNshFJ9ejddBFjvugZ66mMy68MCKpvuAP+5+wOCJ9
	bgv32IHFY0tw0NfMwJM08GgZ5+US849vYy2bWPwQC1tkSHPjP74EmvQauHHwusiZN4YS6O+1vT49P
	+yR/p1/cPHdJyGQkbURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OZ8-00000009U5Q-3Ode;
	Thu, 03 Apr 2025 17:41:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OXk-00000009TuJ-2G8T
	for linux-i3c@lists.infradead.org;
	Thu, 03 Apr 2025 17:39:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533FV6PO029848;
	Thu, 3 Apr 2025 17:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdVc/AGZK1CW3+7mniCjY5VJ5EemJotK9Z7GRWdWvbA=; b=JwG4Eop9bsF6+ADx
	6VSGFS5F4rO9QXWdx+oN7IcdVeA7J276CKFv4FoOG8NqUSWidfaW2tZl85i5EwQs
	yoyXxQ3ab6GuXYAy4pX7Sg5XUQeiQSyghUUo8E5D5vUauif+zU12MwiWOVb2IAZn
	aKXoxXH0zYkTzKaWWrZMqh10Lz0W3BwqEClpCTHVpUzOBIz45tg/hw1I/63h00Rg
	vF6U7PXtlHsAB1zGLdp500+QkFEev02/itV1GQ4jrDXudVsMUrRIDYCQZh+skZGL
	2mN4HKAGHW8myNQCBK9+hoUTqP89D83x0lRQPhQdygkV9AbA65xD7CCrDnM6A2JM
	+098CA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a4e7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 17:39:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 533HdlBP009054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 17:39:47 GMT
Received: from [10.216.18.202] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Apr 2025
 10:39:43 -0700
Message-ID: <6ce712e4-ca50-4c1c-9f77-a5d8b706d168@quicinc.com>
Date: Thu, 3 Apr 2025 23:09:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67eec7e4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=DNBpd1jkDncxHhzUvaYA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2D00ETk_bL3bB3qEgsp3IfQhsQpAeV79
X-Proofpoint-GUID: 2D00ETk_bL3bB3qEgsp3IfQhsQpAeV79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_103956_781139_2D864AD9 
X-CRM114-Status: GOOD (  16.73  )
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



On 4/3/2025 7:16 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 63 +++++++++++++++++++
>   1 file changed, 63 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..25f0d92204d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> +
> +description:
> +  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
> +  bus mode (I2C and I3C target devices on same i3c bus). It also supports
> +  hotjoin, IBI mechanism.
> +
> +  I3C Controller nodes must be child of GENI based Qualcomm Universal
> +  Peripharal. Please refer GENI based QUP wrapper controller node bindings
> +  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    - qcom,geni-i3c
To be replaced by "const: qcom,geni-i3c", left this in local.
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
