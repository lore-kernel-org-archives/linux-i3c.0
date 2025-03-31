Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD699C36017
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 06:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdN0F3Ls9qPk47gIzsqj+5aa1qNxoS2QgQVrViqxRtw=; b=HjaGlIHD6KPAHY
	npP8Q/vnbmqOHISgHfiJ6mL0iFwJetP+W53vJp0khhI2FrzuJyISZfjIZllG+if1l5dM+Cn/O1kfF
	ssaILTDAsBBe4iReAF1yGkXfOP/qUcZA8BIVZkai99Jalbm404oSGU76TYlcZ4IBEzwdukFiMeWu7
	HBE4kw6cQxBfzYfus6DbQopmcUQUQd1OzHdzGrmWGari3eZvlYjZs0H6iwcaQUZGbb4YBukXoXGyG
	ZPYqMRdTjIPYYzf3URTZMwAaR1SaklPDRFXiXkXnF/ScZ9cNxCZIIuJ0aRugBYyJ/sRyJdh9aNrrv
	7N0kxMORNsLj0ZYfeXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz916-0000000H8iO-2FHU;
	Mon, 31 Mar 2025 06:53:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz913-0000000H8i2-3q3c
	for linux-i3c@lists.infradead.org;
	Mon, 31 Mar 2025 06:53:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcHs014189;
	Mon, 31 Mar 2025 06:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZ+YTWORFfoODnOFnZUutcfl5JuliNWq21uLksy5p30=; b=IuDv8R2Sogzg7psJ
	8aRBkWboIffzBLq1eymTkCz0zq1XUhM5NV0fPmC2EuBg+WWSO4dIOb1Q6bkw++II
	sMr/tWLFpa6pPksJ4e90feoIPsJ3VjUOqpfOUjyVRh6vp1LNEgs0iKHHSsXaVrfU
	4GrjvbliEEPV8pTyiHN7WuhDSX80PcKMWcnDvhCbUgnVXSqo6A7XGtSycvRHoLaU
	oFvFwZiQ38ZTJ63ecIAwvvkMLjy4Rf7E6W0n6CWXVQq9cH+p/ihuWbC1Y+9LXN2c
	sjG7tY5lg+jyAylpdEBw1iM1tmH5CAMzQ791mAJtq+imWlEO6vH3hDtwiIZaPynj
	o3UI5A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1num8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 06:52:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V6qt99006487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 06:52:55 GMT
Received: from [10.216.38.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 30 Mar
 2025 23:52:50 -0700
Message-ID: <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
Date: Mon, 31 Mar 2025 12:22:47 +0530
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
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
 <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
 <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
 <838dfc8d-24c3-4f03-9c24-863259bb22b1@quicinc.com>
 <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vNeAZpDF50fZftzFKNSLKpbkfEJNRyTU
X-Proofpoint-GUID: vNeAZpDF50fZftzFKNSLKpbkfEJNRyTU
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67ea3bc7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=yguuy8DFeHIEintHG0IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_235302_000647_E15B7D1C 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On 3/30/2025 3:12 PM, Krzysztof Kozlowski wrote:
> On 29/03/2025 15:31, Mukesh Kumar Savaliya wrote:
>> dt-binding file name: qcom,i3c-geni-qcom.yaml
> 
> No. I already asked to use compatible as filename. Don't create your own
> rules.
> 
okay, no problem. I was trying to follow previous i2c,spi, serial uart.
Let me make a cleanup patch for them also next as mentioned earlier.

For i3c, compatible will be "geni-i3c" as suggested by you , Rob.
dt-binding filename  "qcom,i3c-geni.yaml" OR "qcom,geni-i3c.yaml" ?
>> compatible = "qcom,geni-i3c";
>>>
>>> Best regards,
>>> Krzysztof
>>
> 
> 
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
