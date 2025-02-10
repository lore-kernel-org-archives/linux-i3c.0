Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA9C0219B
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Feb 2025 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4ntkotjGPReLobT/BhJgjRcMY+ArWyOyg2ToCSmFiU=; b=alrKb4Rf/YdA5mq9b61a5CkZTq
	omKsYkBDHpcMgv4/1Matyifv4JxL23rDgSrv3Fprfy0ChaVpDsS3XGSLmjuPuKt4+M3zL9myjQwar
	Rik4/fuZLHdyKZ8Iy5V+Oi0CMRE3v5zE+We3FyHQtUjY73FvmC001wOKqHXxFb1c9DJwxlzQBwHfp
	qkIe6+mfgWz3wgMThcU1gnMdXDuU421jNkJM61EJWUdNkk2EM4OA2seOIk6xWaE7c8+pqfMgpkKWc
	dr2aECIQi8XFMD/wSIb/GMflgPzX4oOIWZBndjsdnNmmxnZVpKZdAktKtG4jQnGgmSDeNFbGyZkUk
	fkp/xvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOH-00000000SJa-0Ox4;
	Mon, 10 Feb 2025 16:12:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOF-00000000SIg-0yj0
	for linux-i3c@lists.infradead.org;
	Mon, 10 Feb 2025 16:12:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HlE7001431;
	Mon, 10 Feb 2025 16:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKPMrlJEpL5C75uiFqCxo4gekloyrrP6igMu4fzz58w=; b=lmOpWvPISaKl2kj4
	cQ1E/dtm8iRC/ByAkvo1851K5JPfhaBJG/ckkjhX6JfLfX331Y0c4bzIw9gNa73L
	0U9ko2Awl8bRll33CfTHoqu6BAUJJrjuCK31c6R20Dxpk54p6TbvrugyU5EzatX5
	Frx/JYoiFEKTKyIsjhAkPI13iJtgXmna4X742oH3ZG11YKVCU3ebvZSO+QUU3HEk
	ae9ifuJocmDxvn85zOdkONt+h0d/+sPFdmvBrpqQQKjcYiLMj9ue+HY+tlsv4CMe
	I1IkibexN3hwDXgoFPKavS//CVsD4sQurbB9irS3fDW9JCvKpaoZAwhAWkRAB+6L
	CMIwGQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxh29v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGC0Sa027609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:12:00 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:11:56 -0800
Message-ID: <93cc3419-bd01-4725-9ce9-40a99075a105@quicinc.com>
Date: Mon, 10 Feb 2025 21:41:56 +0530
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
 <f643c57e-de01-4372-a1b1-7ebde319d0a4@quicinc.com>
 <c7cc1453-d54f-46f7-86da-275636eaed84@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <c7cc1453-d54f-46f7-86da-275636eaed84@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ezc-EtvXRS8ypoiIQoeaBKvzPJQ3KF-w
X-Proofpoint-ORIG-GUID: ezc-EtvXRS8ypoiIQoeaBKvzPJQ3KF-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=974 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081207_395975_53C2EFF5 
X-CRM114-Status: GOOD (  10.49  )
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



On 2/9/2025 5:16 PM, Krzysztof Kozlowski wrote:
> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>> I will remove minItems and MaxItems, will list Items with description.
>>>>
>> Wanted to check if below way is fine ? Because some of the ask to drop
>> constraints are already present in other i3c yaml files.
>>
>> if not, could you please help share example removing constraints and
>> listing item ?
>>
>> == Sample ==
>> properties:
>>     compatible:
>>       enum:
>>         - qcom,i3c-controller
>>
>>     reg:
>>       type: array
>>       minItems: 1
>>       maxItems: 1
>>       items:
>>         type: integer
>>       description: Base address and size of the I3C controller registers.
> 
> 
> I really do not understand this sample. That's not a DT schema code.
> Please open existing Qcom bindings and look how it is done.
> 
Added changes looking at existing i2c and i3c dt-bindings. Please help 
review latest.

> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
