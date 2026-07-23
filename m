Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C5FC531CA
	for <linux-i3c@archiver.kernel.org>; Thu, 23 Jul 2026 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Narm5BO7oUCmo9SO5KgNdlkSdKd84Kdm2Tfeo5gIGU=; b=lf2vRSa7YeMurI
	dW2oc2+r6tfCxeSwtyUkr3n01ezwd2fOroWAPi7XVDkYVxf3WkK0MwobRFbVn+nbGFQfs/x9+AhBJ
	xMH5SAn5sckF+ZLmaDUFwXxJIrpcG1VYtwmaQfsroyzW/8I3njerUVYmqRDoIx4BmOrbvTx3PzUAw
	MLN9CoioL9CjlU/00VygE1jqVHGVwrIHEkC69eqUB5VpaSln2GP74AzdBqhs3nuAcLnhgexECEBgK
	Y5l/5rTmEW8p5Pv45qWdLZGrH1PcwdxwZWWhH0uGciN7WSlKddkZjiI1J/yaZXjGitc+cvDIWOYQ2
	6AfwlfWsIdXOLwVXs3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsfv-0000000EFQ9-1LUA;
	Thu, 23 Jul 2026 12:37:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsfs-0000000EFPj-21iH
	for linux-i3c@lists.infradead.org;
	Thu, 23 Jul 2026 12:37:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qkxX3642784
	for <linux-i3c@lists.infradead.org>; Thu, 23 Jul 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiJv4OSyGHajCnWG7/iQUwjk2Gu578Qylb8lkp9wWNI=; b=gN1j0lskuLL/8Rz4
	5I/dkqBuAFZm25vkgMFD8Nqj7cL0J8K2MNBRLl3bpjm6ofZ/WyhONcK+QtID0by/
	CgT0/ky278Hfl/fMQGGVlI0nLoaf2Wcu/2wfWTjiutOxISiAUoNi3QPO4tc8O2Eq
	dyNzVwoFrn8ouy+2Z1gpGIJk9mcSKok/hjLhw9CkimGn2n/XutU5VZ3hsR5l59HC
	2OKEx0jWJv8WrsDGtrGmBpUoqxLwqtsHipBmynRYlHRVL5AQ48Fp+AvvmOow9ilm
	Fbbe4PQfYm0cJyh+NDgzBn4TIPL0xPBNJASw6B9Rwy1hKcvXwhzwT11Fewr1o/Lf
	zOSAyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha21d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 23 Jul 2026 12:37:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so11236325ad.3
        for <linux-i3c@lists.infradead.org>; Thu, 23 Jul 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810233; x=1785415033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiJv4OSyGHajCnWG7/iQUwjk2Gu578Qylb8lkp9wWNI=;
        b=FOYhoPQPGlx563DNp1dg1kOkEKnLH5Go9L61NmoNxorVCCw3ITiFd5/iPCYezSCvjn
         V+Pb6H6jEMreL9eY5JYqDFUzW/Sq49ka9ILpXROegmih2R0bJQ5mzfTM78M9nRo5Q+9d
         CNbDMVlOdhGH2jIFOOFMfUwMGZL+fXMtcdxynfoXgN+t87jAsAmFzjlTBkvp8vu61m5e
         RBQIj5vsX0O5fZwEBrDmPn12eqjE0cDgODGKhtawlg3/+nZLoaAxM96WasnRj+BLzGyF
         fG5jFhKaBPwArivMOOZ3Gx5y7i8jCEfWFEV2vANhWAkrDPZJVfJZwp2D4dMUOelBBd+s
         az0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810233; x=1785415033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiJv4OSyGHajCnWG7/iQUwjk2Gu578Qylb8lkp9wWNI=;
        b=qf2d+QbkPvXJdwC6h5NfOAG1SkDJENyre7eXRJAXobfhFsaJ/ixMk85soNTd72EkW7
         5UbU1G52tBJoouy3WdrSzmtH2sw8SJYDVCDQkSBOWC7mEVw21bHio9hLjwew2JEjCdrZ
         +5e5V/O9SezxkN6eG1Dsxv+dTGzBFA5jfJhpwNAEt6ICjqnQ03Y/gB0/SJv3uCyp/uZW
         XBL/5RvnBBupWiS88AeuZlQ04C1ktNUCYgKNIx39EYXCLc+Vuh6ti83HipK+j72k3lsH
         xHjs+vU4uOuV/4ENwDk+6lS5TLmP61jE+gSXIKMQ/eJvOPD1nryr0Bx3shqM9Gy0iC/o
         vOlg==
X-Forwarded-Encrypted: i=1; AHgh+RodOFPPdDYUPkmY15mSMP98JE5ZyYFtMEUwd8FrUfIFDYxouQEJEwcUQ6YWaHTNsVA1jS6BaPGlAe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkFOjhxP7Sz9f0y7h2C7QzHXoDhFmxgsIVSApUPTQykQ76bq+
	70CoydGZ0jtjFiOYOuDTPFH/lD0KIUb+UJqLurpVK+zmv3AMuceGfAEoYrGW4bmVOFkzC8QLA+A
	Pg9FCcL9+U3msLCjzEkorckKNP3KsO1lkLsQEAwBdk621xiV44IxXi73sN9KMYF2K2Nx9
X-Gm-Gg: AR+sD10FsCiJmxe49EpRAL3KEGoqXEI+rFtA4wpiyOOOXu7y7oJIEbaN/+hGOY/i7sb
	uXQ/ZVp1OomOVD2s6lCX50n8qNwpo9OlG1nHNzaB0smxi0BqmdocFRwrv7Esjz78X3ztDURyz2W
	hnWSSERjcZRV9Wa7Cqa8PhiQC1ujqSYZlJKb6XFVtQK1v8bIIRi74qLL/EOUGZq9Q6iu7Ik3Jar
	7veY8JlIbYa+0pjukMHWgsPwdHNf25XBTzEnRX6TyOZiGeAAvXh3DF+hTimX5lYxyujvQMA3Hrs
	O8HFA/mYkxcg+vzsZar8Wp7TCIg6ytQeeD1plcpnc4SwvAxYkcWq5KLXcp8TcrJycQXT5anoPza
	qoJLNmPVgeYO2qMy63uQN8IUt3GLHKRBRTTg=
X-Received: by 2002:a17:903:320d:b0:2cc:c9cb:371c with SMTP id d9443c01a7336-2cfa6c87609mr33999915ad.40.1784810233546;
        Thu, 23 Jul 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:320d:b0:2cc:c9cb:371c with SMTP id d9443c01a7336-2cfa6c87609mr33999535ad.40.1784810232995;
        Thu, 23 Jul 2026 05:37:12 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a40fsm33202025ad.78.2026.07.23.05.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:37:12 -0700 (PDT)
Message-ID: <ca4b38b3-d32d-4aff-bb6a-6662562ec0bb@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:07:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: require dests for read CCC commands
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: tze.yee.ng@altera.com, lkp@intel.com, Dan Carpenter <error27@gmail.com>
References: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <153608c2ff6504fe29f5f727a23c53c41768a44a.1784796086.git.adrian.ho.yin.ng@altera.com>
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a620afa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=yBYpec10AAAA:8
 a=EUspDBNiAAAA:8 a=y2YDxqopTWoFPjg0B8cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-ORIG-GUID: EWdA4c8lpRAXpctK5KAt1TAg9_Oyq23j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX3waJS/DDCWOj
 SdPNu0KTgzXvPD9dBY+VLcONWySQgjsdRnK2HyOvW6vD1Gysx9hV4wYvFSX1d/i2lJY/QTNy5kG
 cIiytlVuIKmLE3fFRKK1ZfdnnE0yWXSaCpf6PIPTKv6OIBXtpTecMKfyIDSruaRX9kNjckL+4wK
 kftRa7cWlVUzggdOdS44ujl7hSZT/RNqZiZm6Jd8fqTgof24pPSOMrUE1FD//rkR4+hzLFCsq/K
 eSPArsuGg/a5dk8uakbdXgiR/ymdruvTN6LeKFPJ9cukG+qMXYNkmW57m2atL4x4B6KXrDzZ9Cg
 tOldNuizOSfrXb5H8d1FztajlzCa9LIZsO+/YCoW/3LdAYG6yWaJOmY7cCI+p85vbxINngNvTg2
 8cxeb/Hi3IWlyHnbCe28+uzgKS5PaZGm4I3EOCI2SF1NTWVUt/lIzHfJ3zzoujdOFpP8QIsTZC8
 cos0RUD2Pr1e3sivWmQ==
X-Proofpoint-GUID: EWdA4c8lpRAXpctK5KAt1TAg9_Oyq23j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX2GU76qBfCTx/
 9/wxmf6HiujWU7BH5usHaLkC+5eMYmf5j6AAF9zYYST/jgqfHIaPGRoA0YPYSY7jC8Qhs8Wm9VA
 s2arxXo5cITd+k2p88y77BvaFyEdkN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_053716_652669_1332230D 
X-CRM114-Status: GOOD (  11.19  )
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



On 7/23/2026 2:53 PM, Adrian Ng Ho Yin wrote:
> Read CCC commands (rnw set) always need a destination array to store
> payload data. Extend the existing direct-CCC validation so cmd->dests
> is guaranteed non-NULL when cmd->rnw is set.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202607222347.TXH6r6ie-lkp@intel.com/
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/i3c/master.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
