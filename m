Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F370C02194
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Feb 2025 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRi8jLbjW9rFECmy7O8pYe/DJIxy//P4NWLX5/iCosc=; b=gPYJsfG51QS0VJ7ao6dZBhtFSN
	JeSbIfW0/c4Wk1OszADa1fyiRWwEp1R318QNtjnJUvRopY189RccZG+Cl5an39VSn3KjQUePRRn8C
	9nbO+9zGzL7bMRJhDGdM10KKDyKTUF6W7RqrIbwY0ThhHW7aA/H07VW1vMiiVfZ6Uhpbs1AmNM6c+
	pYEkAQ9t7rp1gCaOX0IFRBHIUMhjpPBvcdCkgMBq1qVZJs9R13D1Vs6RGWj5gjVolt449/ob5KmYU
	PyeDDInnDNXIT0QYPY8/gStKX+9FtwNqXwMzFS75sfukpA9ISyd1a1fisFRuSKlTmyx0xzh5nrn8A
	ekB9vHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgN7R-00000009RnC-0stx;
	Fri, 07 Feb 2025 12:06:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgN7O-00000009Rms-2bwr
	for linux-i3c@lists.infradead.org;
	Fri, 07 Feb 2025 12:05:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176WWhe008285;
	Fri, 7 Feb 2025 12:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX2fRni3VlDgRLhRmAQ2ij9iIbkWH1v1gTy6Vdln1ok=; b=StKrhOjilL7eYgeS
	SQVOI8IcAQeMnPdn9IciOpiAzNJduR/VYwcFo97ShnIJsasf4k4Q05KwBeaO3UA3
	EF/T5gAjyfqx1bymKtt49W6IG3LviWuJsbl1Vr9BhovVe4yPhPbKwX46PoELnxQR
	EBFSZoqq0SC+UDpPgLB++QwIu+GtVikVi8Ge3ynMLY9Tam8R9bqQ9Vwbs3UmcCXS
	Y2QW+buzJsEUWGEIqACpltUjgX9Io6z27h5jEm6lsv5AKzcIyMYLK+srMHQG0cvU
	1Jw1lpx6nsMRChsOi6OpJtSViTnNV74Tw6VnOcL0bAgmZKRz1E2lZCicdBhG8Ee5
	AkLROA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f0uvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 12:05:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517C5mBb028485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 12:05:48 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 04:05:44 -0800
Message-ID: <0670d046-a69f-4840-b80b-3cd1d3b1ef43@quicinc.com>
Date: Fri, 7 Feb 2025 17:35:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <Z6OQb29Ca2tmQs2Q@shikoro>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z6OQb29Ca2tmQs2Q@shikoro>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dw9mIXA4CBA4rLWnZ49OcEC2p9C5hghG
X-Proofpoint-GUID: Dw9mIXA4CBA4rLWnZ49OcEC2p9C5hghG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=898 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_040558_784923_86401462 
X-CRM114-Status: UNSURE (   9.00  )
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

Hi Wolfram,

On 2/5/2025 9:53 PM, Wolfram Sang wrote:
> 
>> This patchset was tested on Kailua SM8550 MTP device and data transfer
>> has been tested in I3C SDR mode with i2c and i3c target devices.
> 
> Can you share with which I3C targets you tested this driver?
> 
Tested with Prodigy : one target as i3c and another as i2c. It's not 
having on board slave, but internally  we have target devices connected.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
