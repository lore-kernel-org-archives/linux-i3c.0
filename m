Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8057CC55822
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mICj8qO6eo424M8MJGa2GtcRQ4g5cHuburWrlqeKUDA=; b=ZzcoCGlcg0fQSb
	VraWQM/PAK6dM8/h8qwd/TXzg4G8NfgSqZjnuyLMq/ACAS2p/bv19S2AoN1NOXJX+7fWq/BclpZh7
	Js5ZLDybDb2wDhclH2hIovSB/Kh4XlpeWHdoqaDDVYMugksqpQrfDCvdSYk69HCDd6IDBZhkI2cR1
	MTCJSAxFGhvmxMcN14AVXaYCGjEEDU/XHQYsSJ9NUdOii2ToqX8c9exwm8fLv0wUHVYzWhpMmebcW
	H+iRYd/B8093i+c6S3JweXBgqNjoCWI0dVAn7OGxbpiBav9iDlqPnMYGjoGJbL9ShZB3CeOAgExXb
	5PgDnQaJh0bR+YZ+V78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKFW-00000002dze-3yC1;
	Tue, 04 Aug 2026 18:52:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKFT-00000002dz4-3S7c
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 18:52:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ffmtf369676
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 18:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtP2L62OBcnos1NyatTDhxKiVMhFH9/cdtH1RA7Q+Js=; b=ovAkk72EHYo/90hU
	T2pZh4UCjmwOPBXq/jEDdFzONs5oBoPsDyf+tRP6MVGxkHK2oosn2Dj6c6Zp0IN0
	yDkJZ2SaO05kXBs8r3HAp0cPpmW6tT31Evco7l2usYJqaZzC/wypt1evByg2mjFF
	xYZ/w5gMtmNI42ByiUJjuTtUU1xONCTVymnnxwXKeBmh/uV88/63phP9CQSLh9vg
	J25aULN9xUbUopCi6l7ZgSoxhtimVFtSLxUxK7zTzrPOPV2iMj8y5w316C2hBdtX
	+YtLm1K1K28uBkuM4AMsmsgjH6O8B35E7v2dPt5fp6SE3G1qrSjvlhY4LIhmL3RU
	x4+jkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug659twm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 18:52:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so11969595ad.1
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785869542; x=1786474342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtP2L62OBcnos1NyatTDhxKiVMhFH9/cdtH1RA7Q+Js=;
        b=EcllVVHN+GMHw/nGHwc3LvaQF0FLID0YG/sszSbI6POVGOjsNb62SDUMYBDFu9GZeR
         xlmmq5U6YM3g3Q4mOB5GffuLk4gKrL53e+JTwlTPkTmsh9hB9PWtm8xOdBbmdhdONoDc
         TOIhtqaCpcoE6HR2p1fzrh0NmJ5U8cyFHYJpjHBgqvy8SHJiuBwFrzauTg73in83P1SQ
         mzjpbsUMKEczKRM0a6khqvuGqyo2f3kBSJkHlMKZvEYaP1EDkMPEEslZBTOWr3KvkIRr
         Su4PhGeeLqBB2Say2PKySes9xlSjI1zf+1fZhtQZ1gR5nlHmZXputKrZS2ClXglruCva
         edzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869542; x=1786474342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtP2L62OBcnos1NyatTDhxKiVMhFH9/cdtH1RA7Q+Js=;
        b=LW0JfYIzoXp3L+SSbz1NC5UZtGBHzCeR5GGTR61NqgUZTe1xBqokRQUiuDszK1HqvW
         0VwMXH5ITzQG01LKg2FBa+0ur1WqcSDwzYY4OmiEQZKWCH4BEZ1+Zzeta8+qVi9jbtQ8
         6gi/7zSghRYoC+5LjLx0YsAyGZ/5zA9otQjxBZr9xTDuRz2fNTcWN3ICF9C2DVrIBhWD
         hQDunTWXgzdn2B5+QO7lZ8b/dU4DmPMq95fUNL79Ucz07gD8Bz0x5Lkyq5L9kOJVbIW1
         53/f9OSjCWR4PjdXL4BJhfjxy/DtnRy5mM47MlktawClT9g8FinYDZ1k6wvkwzIt1Hnz
         J0JQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxU9z60DVPgJLcGZgmR524lnlQAT+uY/QLeKvy17IZROfP0yFssoEZ/veoh/6Wmo2fevOsM84oPh4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbl3Gc745O1OXC6F48KPEcCcBd/3Ns/Mvj/zE9uhvd4cwK9pe
	k0eArYrf2hgFOBZQnEImyaflwSdG1ShHFxla98bxCt1uE5eXkC4nNBJJLigVOgz5d7Emxf63w+R
	aC6KEpNYD2mHIbTV/xD2qSeWEz1JgCN3WlWWaRGQQgvAwroXTnCj67qGsvm8dwEdf46uuvmZTqh
	BP
X-Gm-Gg: AR+sD13S9oWco74z3vCjGGKPrtfH9pNcYJ4KcbsEjzh64B840aXAsE2i+2M56Gbhhgx
	aU8oR+nsQIr433nuQc6ZMJqONAhdl/XJtxtgdoaA+tkKvzYsY+jbBg/G7uGTC5TAKqJeAlnvZAw
	dF4uEXEfkjvw86+ukeNCEJutvG0MMUUmWCYt/Es/wqwlUIYqXV1FeWVMqHkV7+Rz4Q0V1G/kjRe
	W/CCSYUmcqLAONjLBSgpOvn3s/ZL86+LEZ8r2Da9uRQAh+rhXdfwoOOL59tO/TucNndAe+aT42l
	Pd8cOCACt0WkHlBP6QC4XksLUIscoZbPelNt6ycOfIHXSC2g8UJCmdvWIdjPykmzB4iXhY6FLfD
	S9LDN7pR/Vl+7dBGpHPFD8cMcxoYyaehqzQ==
X-Received: by 2002:a05:6a21:9991:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3cb6c9c1887mr5739256637.22.1785869541527;
        Tue, 04 Aug 2026 11:52:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:9991:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3cb6c9c1887mr5739208637.22.1785869541078;
        Tue, 04 Aug 2026 11:52:21 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm6700712eec.12.2026.08.04.11.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:52:20 -0700 (PDT)
Message-ID: <76c03e2b-649b-4316-9c3d-4ce5d27a86e5@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 00:22:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 10/14] i3c: master: Add helper to query bus wakeup
 requirements
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-11-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-11-adrian.hunter@intel.com>
X-Proofpoint-ORIG-GUID: LfV69ptDfS1OlFzJaMlO5NuClzGPEnNS
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a7234e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=y7ZiA1EjnykWbA9aLYYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE1MiBTYWx0ZWRfX4UwAJKxb9rKI
 CBbITk5sDvyA8+Og9mgwnnKoBCqGn7hNmciHCIwIZfIu0VRtqbP3af69wBcjcP5rSVrFIlyrs6u
 wCUlk75qP/JDHmk/eTB9Nqqs752T7Jw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE1MiBTYWx0ZWRfX0OuNwcQKv/My
 UfEsym0+d9u4lxpiN3PYfGVaqSLc+6JdZjM7jRSZcVcz+fCMS/jwby4z3IOuF+jEo7UrlTRc8qr
 ULdWgPpKX7BmYfr91QMS5E86YFl9+DNAkSxcjSmjJCqRPKCFU4R1v08Hd+8UPavG+j+by/Lt6Dr
 0xVLgbj2D+gEWsv2mDFlvz5XPFtwq/CI5sQKlKcopNXkG/7X+w6AFI+OurALswXPDqgn3GQBWVV
 5FJlL2YwOr9Jf5Ylz2uOuvxwhztkqn7ijgntEcT/YeDIFe5ra6tJjrCRafxYUCz1Mmc0+dMfKVC
 VhcuTBTJWpttWmdjtGKNh5nzJMFYvfyCZ4YN5Il0bF1O2wgGnGRZ8FQw6E3sp3KITNTBXBEoe42
 XKSxzD1/ccDy2pQGTV5FCvKjYK+HouRI6PuwPxS003mmjcA433zgInfE3dfVQwjkOiOJ9G0ZSfh
 6b3vr1NKxwTucBcyC2A==
X-Proofpoint-GUID: LfV69ptDfS1OlFzJaMlO5NuClzGPEnNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_115223_985392_9109E6D3 
X-CRM114-Status: GOOD (  17.63  )
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



On 8/4/2026 7:08 PM, Adrian Hunter wrote:
[...]

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 8c9e62e6f146..baf4769f0512 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2150,6 +2150,41 @@ static void i3c_master_reg_work_fn(struct work_struct *work)
>   	i3c_master_register_new_i3c_devs(master);
>   }
>   
> +/**
> + * i3c_master_any_wakeup_enabled() - check if any device can wake the system
> + * @master: I3C master controller
> + *
> + * Iterate over devices on the bus and return true if any device has
> + * system wakeup enabled and IBI enabled.
> + *
> + * Whether a device is enabled for system wakeup is user space policy,
> + * settable at any time through the device's power/wakeup sysfs attribute,
> + * so the answer is only stable once user space is frozen.  Call this from
> + * a system suspend callback.
> + *
> + * Return: true if any device may wake the system via IBI, false otherwise.
> + */
> +bool i3c_master_any_wakeup_enabled(struct i3c_master_controller *master)

wanted to suggest if this function name suits 
?i3c_master_has_wakeup_enabled_devs()
> +{
> +	struct i3c_dev_desc *desc;
> +	bool wakeup = false;
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_bus_for_each_i3cdev(&master->bus, desc) {
> +		if (!desc->dev || desc == master->this || !device_may_wakeup(&desc->dev->dev))
> +			continue;
> +		guard(mutex)(&desc->ibi_lock);
> +		if (desc->ibi && desc->ibi->enabled) {
> +			wakeup = true;
> +			break;
> +		}
> +	}
> +	i3c_bus_normaluse_unlock(&master->bus);
> +
> +	return wakeup;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_any_wakeup_enabled);\[...]
[...]

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
