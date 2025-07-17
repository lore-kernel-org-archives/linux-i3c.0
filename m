Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52053C83F25
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAo44mIHL06L4bv7wIx5GuNI5XdsSFsKxXcyOCL1BfM=; b=vSNDUWKwXvXKB9
	iDD7dANY9RQ4CHXIZHik2Hx4NEbYW/o6ogk3CFdFNPDFjSIEivKpiR06xvV+ocQJGTt88tX57Cvdw
	iVwbdPYAtFx8nGEsHPwqume7A5gLarRsLbjSsLenyqJ3MDVjBf5H77QMEJEpUgEg+zAUdyKh9x8km
	bOKEjVQiP4p+XxMXZr7xF20OrwAZD30DUrEY4aJuycbDJ2VtL5bVlQObE66grM5GcrB2mGzanXBrq
	pecejOi2thK/FpCeZ7eO8P7PIks9MkQwSpgQJEvtfM46YkOweUK2uOO7FsFwJEq3DgVldpUvloUAH
	hGr3/RRe6/f7R+5eZyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAx8-00000002FoH-38iK;
	Tue, 22 Jul 2025 11:14:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVZV-0000000B7fX-2LfS
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 20:51:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJXHeY020667
	for <linux-i3c@lists.infradead.org>; Thu, 17 Jul 2025 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI1GQsP3FtlWSvO2Fv/8SUzJeJc5OU5sQJ2EHFJlKCw=; b=PnjB3q+zCE/jGSpK
	vqHLp8hghvN2yGoF9XpPQXcjYL2X4IpoEK9Zg0W7DNfTwXFXP9mqfm7JchXSknT4
	oqlkwiUQQr1cx0F5L2DlhiPR2rE56Kb9MvKw0uyWUpHOjyB6jWT15Elms/N4rsJJ
	f+JY2CkGQCiVbxHlAUSTgjbd8Ec9J8w4vtskDWm2WIBcymwzvumavq2zxEnH0vBQ
	cl7XzMq1hMaU9ySLSelSDJ8iHPeW9c29RBFQ18YRvBIwnVhCsODBr5uPdvnbXs/W
	dU28SqxQGMZGU7fMVAjNfQEGTtbrbauPA7rRc+dfeUg8Q/hiECZmSTKjneIb+fU8
	+xSJYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpm76q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 17 Jul 2025 20:51:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7de3c682919so30564085a.2
        for <linux-i3c@lists.infradead.org>; Thu, 17 Jul 2025 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752785476; x=1753390276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zI1GQsP3FtlWSvO2Fv/8SUzJeJc5OU5sQJ2EHFJlKCw=;
        b=dzRKz4OkuG/BnpMb6kUCiO8crlpC9oN4SBuwo3dKy5iOLf+kYMwJUuvY+2rHK5FvkA
         pczq445nNux7L2mkWaEDZP4tjUCiw5JDWYoNE4iBhQL3iLWcFInbsC39B3cFEyyUCvhd
         HvV1F0NhWtXvjwpjLbS02TSeoS7P10z+MqKRPD0D8XamM9iI3W24YcIoB731xZR+fEZ8
         DaltzTjFQ7qIe5sh8jdDRlEgaFyExXs7z1Pvg6SwF0yI0F1Zn/R/mv5DQiCNbRY+A7z3
         Jw53sOJVKpE63uNfdL3kHvwDH3IMqFCku2uBWqdMBHU7+lhTwgCVseTCEDExYfIs2mRC
         /sjA==
X-Forwarded-Encrypted: i=1; AJvYcCXhrms9LlldOyRRDZqPyPFmAqnRScsKDhNYSNrI0Mv/jkUsrMwxlaEVRQB5r9x56BACLXdmZIh9gpg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjqbnsDifNuymFlYYIrrmaHugIZyPhe0TVTk8aUCz/guzrp6rV
	u8h1O4ZRcKs0pjB8NZOLTxmjFLPr4j5jZ1BJhFWDPtthvpkYRk6wus1+DCYDVYGNvmvZicsZKy2
	UFFKmVMEbXzYDweevfXT6fWP9790ngAIwyuashQ2KFmHaOPbwTgdSqHLYCKFtuIR85KLa
X-Gm-Gg: ASbGncs0D9xbiPQPHZiaeFTC+hlNf/RrZJJzVxksDfBGjmthyaqZdGMOBxD5JeqFtyS
	8np5Vg4Z2h84+ntVtDMcz/6A1dB6gALFgPFoa2PGOVumFi8EdmRF4GGX3k9Jcp7van541AEjo4U
	l8uY4MozQxOKAYIv8tFiZws7RWFGHnAwXoDzUmzq/rYqHycybsMiOpYY17CsgKm5AkllFkM1ZWS
	TCQ2Sv1TDmgNUkcT+Ue5iJphwaF4OWdwl8GUGztrvEueV1XGmc2lm9K5ltEhcVmO6t0HXB/k7nH
	KLMCgpGLfIfuujZMCE4/jRp5Lh8ZofjkX2jG2pOKV9QMqgtOQ1cym8lZD+QOaKpWjXAeLfW1f+O
	vjp+mkRCLpRDtI+aABIzK
X-Received: by 2002:a05:620a:288a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e342ada387mr512191285a.7.1752785475669;
        Thu, 17 Jul 2025 13:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1oOZ0EIsupcE2PuNyin2lTsXVWnKq+kC+fhAHB0zn97Fx4BA87XhhMZqt3iqSgMkwZ2vC5Q==
X-Received: by 2002:a05:620a:288a:b0:7e2:5349:7da1 with SMTP id af79cd13be357-7e342ada387mr512188885a.7.1752785475094;
        Thu, 17 Jul 2025 13:51:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df540sm1406774066b.163.2025.07.17.13.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:51:14 -0700 (PDT)
Message-ID: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NCBTYWx0ZWRfX0Knjp95GAerJ
 A3D47fUS/wsIBNkJcr5nkLoTlSgwZupcQNUMsIn1yILgGRt2ABdBn5HfqOtxx4DGum3w8OUtfLT
 VJYbhMWDdvPHTaDDch+DJ+2+vqhCLBvR5NOqEaNPNSbpaMo9w1Caao2lSuhdKyHnR/aSujbJtjA
 U6f4PA04Ulc7WIG7udZxdPickJlbqybXLr+KNHKgFH0mvHhJZQZFjVeax6swGNM0ZzsznvBPDwo
 rMTE1OaUlg/bJmqAoR3mdzvbmtBz3gX5sZFNLzbJ9RFvdugTgaSqKiBD39usi7MHIMF9kjF3M9n
 bXp791q+EfYNGSQgfXZywbYEM9Gg4964ZcZ9gzAWV8k8fqLf6NLPy92JJ6CnJ8nF0JBoC+EuzX+
 3L0n+j9OmN0sYhk5qfUBz5UfgdetXr3NkHyX9op+M2mj/1ZSJM2s9Z5FG0qytY2GSfZh9zPF
X-Proofpoint-GUID: B3bsVEXEOoJh8lIyhXAOi4WvIz03ljM_
X-Proofpoint-ORIG-GUID: B3bsVEXEOoJh8lIyhXAOi4WvIz03ljM_
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=68796245 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JRR-jv_DfJOeuxYAjpkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_135117_604702_AF6945DB 
X-CRM114-Status: GOOD (  10.92  )
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[...]

> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    maxItems: 1

In another patchset, you expanded 'reg', can you coalesce that change
into here, so that we don't have to worry about backwards compat?

Konrad

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
