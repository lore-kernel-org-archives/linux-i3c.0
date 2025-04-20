Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0A7C369C2
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Apr 2025 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3QiV1Vy75fDIWWGKzh2+YuMLHLK2zdgFRfSOyQd1x4=; b=2m4WrfHOnCvcVC
	ZEyY/1p/N7q4k91+2giuC7DAjAYLa2qSwTKeyV0PnTlIhzy9Fk837o+H3egyAlauzcwB9e1gakN2+
	mPwHOe1vU1rgICKyi3zlZpd9kPTm7XVIhAIZ5ml2hSL3YmevV5tmhOIrmxfzHbtkgANcOin8dp86z
	2KM+SmeWV0wmSqAl54zQQwyI/SA48iRrLWdQ+i1BGp1EjNXIinXc2nIBNP2M9UaaDQ7j8lJ9uydxZ
	ONzx4jkvA4ObZqvM+cxAM8cX0ag0Ryz2PVklfbYLJ9g6UNGmxy7o09al0Mo7zT/v+RbkjSgKXJi6Q
	0vDAVK0D/jz7IGrMmLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6PrB-00000002Lph-0BCz;
	Sun, 20 Apr 2025 08:16:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Pr8-00000002LpI-1PZq
	for linux-i3c@lists.infradead.org;
	Sun, 20 Apr 2025 08:16:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K5Er4n027431;
	Sun, 20 Apr 2025 08:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8V5FivsJSwKOA/GqRZig2+atb4s6qfJ9nlS/H3PBSc=; b=mgn/p3m2OjKLW/6q
	hGYes6/0NZtJhiKbciX8/38j9agfUMAF4TZld70Oi7QjP5mn5BIT1tk0lOHvIJPm
	fSN2gDN5JQ16Qhmeu3csnE3fl9ERuiD7qNmmheU+VFzhoZ+Z6dpEcKXVje17cpxq
	TizkFsnRJ+C+9DATmPLw8XH7VKfWMnpABkWNT+dJQhdEqHTwSLJEeV1+KZYE/ZBd
	HKRnGxhjP2RJ9rLC7f9BBRgZAjmAYBIuRc6wzU8waa+vzkqbqE2ciVz5vWfd1fak
	VsIb5x56EsfxTcU+NG0jrM5EOELf1LHuqt6IUor/gcexl8oyF88rMNgXjFwO778u
	mpgW2g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450p9ht0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:16:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53K8Gf1u032196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:16:41 GMT
Received: from [10.216.55.51] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Apr
 2025 01:16:38 -0700
Message-ID: <73989cd7-ea75-438c-a002-b83b999556c1@quicinc.com>
Date: Sun, 20 Apr 2025 13:46:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konradybcio@kernel.org>, <jarkko.nikula@linux.intel.com>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-2-quic_msavaliy@quicinc.com>
 <174440334691.3918820.6898145674623743895.robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <174440334691.3918820.6898145674623743895.robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6804ad6a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=0zEQTNxZ-4jhgVUb3MkA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: seBBRghoxq4EEt6ZBqszt6Ic0Kz1fg1H
X-Proofpoint-ORIG-GUID: seBBRghoxq4EEt6ZBqszt6Ic0Kz1fg1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_011650_394357_9E3D3717 
X-CRM114-Status: GOOD (  10.72  )
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

Thanks a lot Rob ! Added RB-T in V5.

On 4/12/2025 2:00 AM, Rob Herring (Arm) wrote:
> 
> On Fri, 11 Apr 2025 17:05:14 +0530, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
