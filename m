Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59579C369A9
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgV3unms14sWFSz4m1q1Z5Chw20grUOKkQChA3qayio=; b=uzXmTUvh1SqPUP
	4gTQWaUzOWuKOkffVBUvK2i83qvW758VV8XwVExv0nhHcuoJrVp+VxZNcU8R6ys2LDtBW7VYsiOuH
	mR6WXK8gThF7iQC/p1ScJNhs70pdCskcJbAO9108jGLbWRVWI+UslTQR1+sQTuThgVauZF3MKfWra
	Q8UoCN7m3yvLX9mYvTq/2b8jP2ODpAKbKa9rugPOFG+giTDhYcZ2Qk6idqDfmA5xk0XxMjfneeGEe
	FBBiUJCaHch9HlAgydAvk/0GYsxabRZXDO/QRZ0KJz1gg1w8IIL3s/o0TBzWAF/C+6mkLtJZskAas
	QQU9aq9TOrrGiS7RIqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QH-00000004HIX-0Js4;
	Tue, 08 Apr 2025 13:55:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28uV-00000004BRK-1uM7
	for linux-i3c@lists.infradead.org;
	Tue, 08 Apr 2025 13:22:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFt0F010566;
	Tue, 8 Apr 2025 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsuarZDN3Gs2nwMb5Xe3ixGpirzkURNjbyVrY3XQMtQ=; b=KLArECh4Qp7U8Xha
	Hopr8rQy/9IbnRe/lNaTsKANER1Dzjqw/qFdHECL5Fi0AsIvXYtYFz7yth50BdLX
	4x3pk1T0U0GFYaK6fY4kU4eLyS5sKtswOmKva7CAyuIpJKPQQbiH4/LWO4SxA3FC
	zfKGVBHODAgxsytZRKJlcADziP6Hn5zrXE77VRGyGCoJS8sC1B2egbDfrl46muyE
	Rx4LbOh2so/biy+KKygoBU5P6poIyDR0Pr1MmXBh4jVI5otU55jqhE8wK5uvFROb
	a3JyAarOdFZbnJdDcfRKe4hgxQsIdBIE2EHtMWJPxj6M3JxQJavMMTc6tR2wpBgL
	T/IisQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1frtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 13:22:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538DMTkn012507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 13:22:29 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 06:22:26 -0700
Message-ID: <8a2c74f4-fd5b-4714-859e-3138e6b01a6e@quicinc.com>
Date: Tue, 8 Apr 2025 18:52:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
 <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LPv9I2rrKRsgG0Q468Gqdainn9YIoOUE
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f52317 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VQQZ3mPWug7dUSpnJMIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: LPv9I2rrKRsgG0Q468Gqdainn9YIoOUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_062239_619876_2B9D8B04 
X-CRM114-Status: GOOD (  10.00  )
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

Thanks Krzysztof  !

On 4/4/2025 3:56 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 07:16:42PM GMT, Mukesh Kumar Savaliya wrote:
>> +allOf:
>> +  - $ref: i3c.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    - qcom,geni-i3c
const: qcom,geni-i3c
is this fine to change ? Sorry but to avoid iteration asking here.
In future if we add anything new (*in case*)we can concert to enum.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: se
> 
> Drop, not that useful.
Done
> 
> Best regards,
> Krzysztof
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
