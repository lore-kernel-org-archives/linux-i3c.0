Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9786DCD4F51
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2024 05:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ED5qY4sdvOlsCSn/r7O+5Tj06Q58oqhOsD1zMcPY2/k=; b=3oPKRbHSROqdLrK6CpnAfTrolT
	vB+hrvIHJ8KLpflgHkvs126KmtT4X8AC7pTwsemeW3jDDWfRvxwSme58hHJcy//iaxO0WJl53ns/n
	8+0Ez3Rmsv+4Rr9Z0GJqyA2dSbeGVam9m6Nx/51/bC+LjA6EIkawM/BFXlG+8lRw3e+j99HuhZRtZ
	XKKnYqfqS6Shruppnhr0IZcl9EoO9f5wIVSNax5KORVhGz1GR4qruBoOmrhoKlX2Px6yk5O0g4szm
	Vdrgi2za2YwItU7Xc8Jfud93JQUulv0z0PZWY8PvtJ/DfdY1OAmbZLzqlio0A0kFq5mpK4U8J24Cp
	0nZ1m4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5OK-000000075UW-41pg;
	Thu, 05 Sep 2024 05:50:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5OI-000000075U2-0RiR
	for linux-i3c@lists.infradead.org;
	Thu, 05 Sep 2024 05:50:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484FxEPf020925;
	Thu, 5 Sep 2024 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77SH1uvNfWLkio+SufQcVBbFIq8m2g0KthoEkMukAU0=; b=ORluSlYhqChwmtPW
	9p4a6YMFpOY6UEz0oHZK/6Tfu5C4TDU22ps+eOF3ZwK6Ucco/HCTz/vb/QjA7M3E
	U46M8YeppE4GbNtE09RdR5XrGeEh+9et9G2yZrdzLvyMwT++TYUJha4cLOPdapQ0
	ySlFpfLWiX+xKuAxwXvNpYbM8+ngv2OyhYipws717Kp1qt+C7V7a/3XS23eVfJ+E
	Q5Et7ZnWZ0kiwi88cB0ZIUWvUIljDDzN+Stir3FVMTzVxdAC1wRkwSeimP1M4vY4
	V56X5T1OP8FmcAfqNFRnUkYN5zA6Dj7FAjp2W0jiTraLR+1He//pJtqTx9Nn0rK9
	t6RtzA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy26asb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:50:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4855oYFS002282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:50:34 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:50:32 -0700
Message-ID: <cc94e66f-6fa0-4499-a851-bac90533eeca@quicinc.com>
Date: Thu, 5 Sep 2024 11:20:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
To: Billy Tsai <billy_tsai@aspeedtech.com>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>,
        "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>,
        "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
 <OSQPR06MB7252463A7C81BF18811DB6EC8B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <OSQPR06MB7252463A7C81BF18811DB6EC8B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -fLAWtVrUT3z_pMbs6UmvaSq9103PQoa
X-Proofpoint-ORIG-GUID: -fLAWtVrUT3z_pMbs6UmvaSq9103PQoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=939 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_225046_193595_10491883 
X-CRM114-Status: GOOD (  10.17  )
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


Hi Billy,

On 8/26/2024 9:32 AM, Billy Tsai wrote:
>> Based on the I3C TCRI specification, the rules for determining the I3C
>> mode are as follows:
>> I3C SCL rate > 8MHz: use SDR0, with a maximum data rate of 8MHz
>> I3C SCL rate > 6MHz: use SDR1, with a maximum data rate of 6MHz
>> I3C SCL rate > 4MHz: use SDR2, with a maximum data rate of 4MHz
>> I3C SCL rate > 2MHz: use SDR3, with a maximum data rate of 2MHz
>> Otherwise, use SDR4
> 
> Sorry, the description of the commit message is wrong.
> I will change it to
> I3C SCL rate > 8MHz: use SDR0, as SDR1 has a maximum data rate of 8MHz
> I3C SCL rate > 6MHz: use SDR1, as SDR2 has a maximum data rate of 8MHz
> I3C SCL rate > 4MHz: use SDR2, as SDR3 has a maximum data rate of 8MHz
> I3C SCL rate > 2MHz: use SDR3, as SDR4 has a maximum data rate of 8MHz
> I3C SCL rate <= 2MHz: use SDR4
> and send the v2 patch
Seems some typo errors, you mentioned all the modes having maximum data 
rate of 8MHz. "has a maximum data rate of 8MHz"

I3C TCRI Specification (in [MIPI06] Section 7.1.1.1) :
MODE 	Listed Speed 	Maximum Sustainable Data Rate
0x0 	I3C SDR0 	12.5 MHz, Standard SDR Speed, fSCL Max
0x1 	I3C SDR1 	8 MHz
0x2 	I3C SDR2 	6 MHz
0x3 	I3C SDR3 	4 MHz
0x4 	I3C SDR4 	2 MHz

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
