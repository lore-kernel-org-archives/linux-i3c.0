Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C808C56205
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DRSqtzOZidFhcsw3FMtfzJS5TBttLXUWuFisjqFmNI=; b=OAERNct2C+DM0R
	Ijj8c0hoHNh4QAKvFB1MdZ4Pdz9Cbu2nrYT57OjS+Tvn4ngR7Z2pZ+1uPj7t4kh6d2rNxdJS58PXr
	1PL3H0yg49GuIGDsiKPMfeGo2alVDjl/QeKfLJU/CiaJn1t7wp3Or77tqD1kQkOnMDxG6iOGzg2NR
	M+gSN8iqAyDIO+nmgfewKNO3BHMyBigA3tq/nOFBlm9cTahEqXqSoiWwdch7BJIU74OoScrxzOCw7
	VwiahO3rq3+KBwznEA5csahDONzz7LVsLPz8y7eKvni8M6ikWaAhT92gI+5xQuNZhoVAtmQ38QsW4
	I/2sYUOJVJKdEb7tBqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3N8-00000006XTm-1Mc7;
	Thu, 06 Aug 2026 19:03:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3N5-00000006XTT-1q4v
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 19:03:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHwCW2704701
	for <linux-i3c@lists.infradead.org>; Thu, 6 Aug 2026 19:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQkVjA9pmubbxZYV7B9I/KJHuyXRTQBwNfT5h9lHEBI=; b=Y3zxAs9vLnWKtiP5
	sZDxc94coZH9/v6VsPJmHViUv9PdcFAyMBVsCttQKUnyP9IzSmpFr2NPG6s79vul
	fr31d2hZjFof3B838lt1jcaEXiDgBvT+6oeE6eoC+v5h1+5MEGlF9dJ3mdMdc4cW
	3AWAGkuaz1ZCmWpjqfUC4jN/ZGrjuLE/PAs0Y9VolSdVn1o2FnxldO1oHKVoRF9q
	ExVzZxrTODBNPPDs9i3/GL5yo8K43VRtaU1Pw73Wkoam7AEs0ZDf1Ai1J5IyA+kz
	0BfKmB7C/pKfYMUSWtANtSsMVfddGdrzCA8QlCREHZbjo/X8jYfOvqlT8WIuqUEE
	MFM2QA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h89qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 19:03:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso4280884a12.1
        for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786042993; x=1786647793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQkVjA9pmubbxZYV7B9I/KJHuyXRTQBwNfT5h9lHEBI=;
        b=AECOjt+2DBFl5U+pjtOI2RFQ1eNph875xXy24V9G4R1kIwV/Xtwsu7Ia1+cSgVNYiy
         PdVVPGWkBy7SR3kQyL+xAEtrT2rg6XL3QmdFyGq10A2OFbG5ENJVCgq9JX1OBYqVBvQl
         e/IDOyT+ZX4Y+HktxRuC0lBZqBe6FpAdSFMG9GLT5T71758FWU00PvHSagVdN2irJ5Gx
         kJfgU54+Vfe63MpriRcrcTYlQLylxM9UKKOK5U5+DhW63d34Dj37VXRk6jVEaMuJTG3n
         k6Hq4B32wjOWfBy/9JdZ3sY5NPC3MznL01+eeWjc9AaY6wvHrfSRTqjLblAj5v6FCK8r
         602A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786042993; x=1786647793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQkVjA9pmubbxZYV7B9I/KJHuyXRTQBwNfT5h9lHEBI=;
        b=avrpYgeCoSMZQ4r2d+wzNIDiyLN8rj6TvA96tcwnb44dk/d+HeJ7cojV/HNyEGgis/
         uOYoe82e5DJfgqvcTouau8NZDQbXKEaE5kj+PVwxTWIe6WVW7zO5A+Fw2rifHM8UkQVl
         mA/sCRJqkcqtGq4hB0Jom+Xwsx3QTpI+twiV+ywGrsXxICXfqpfnu4+uNZNcHKRMBGCd
         HIU+IKC3eCQSoSXBYe1NLs7rGugd8YlAS9QEXXeAKOmPy+awCQE/RW/erflcArWRxSrw
         KrxrR1jKlG8We3RY8C0krAPVpRhBjP4KHHoEGAVb+8fS+7kH0FXfpIYWaKzcJ0rI7kUr
         Bo1w==
X-Forwarded-Encrypted: i=1; AHgh+RqNnRCQ1qlXnPKHetMg4VZo/B7uUtrBDNwiJ1E77y+QEPRfKRXKS/A2aOGIHZxpHMRj5nco7tqyWnc=@lists.infradead.org
X-Gm-Message-State: AOJu0YylJXIe6TVBkahqwtFH+4ESWJWCCPxK/Kmdk0XbeBgbxZwIua3r
	OPf+q4tLuofdSssQ2N5cNNpdLMIPgCj7AIf0LqdiICWwpnsex2mHTWG/UiaM5UyLfjsLDIcw0OL
	88zC/7Ur9va0kFHeO6tvDkgfQpZPOrz+VAh78oOavIgogXDt0QnRlblU2M540TWU/hqbt
X-Gm-Gg: AR+sD12s3ENGbUHEB9RZr9r4e9JU321/V+gHuHkl5YsrLsrM4D8PhN6O5jvjLoX9X7m
	q+wODBknaoUS0bt8XG/Isqzdz5q5cmwc5+cUfBbZJEZXsr11qfBsIfNSBfyTbrEt8BR37bCXI1e
	ywzWUE+CxrHlDoBJRg7T8+ygDy7bdmdnfilZdS6YF5C3azBEeW+9lx+XpOhXRmfVTWbI/ZNLiH6
	pwSCW50yiHF3rue83k7XY58SmRTAGzluvOIfWMlbCkCAjc3wdVNmpETJJCEwk+eKUmADEof0dy/
	kQ48ogvv1JxRUZBNGlIMpkU/LNXjSN0LcXU8aUzaE80FWiJCNAYeKeGPik6ACSqGIuifPe3O3uL
	w6nLfs1z9tlKp5ksptEPBjuijsJWPNRG0mA==
X-Received: by 2002:a05:6a20:244d:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3cb85dcafaamr19832902637.14.1786042993251;
        Thu, 06 Aug 2026 12:03:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3cb85dcafaamr19832835637.14.1786042992725;
        Thu, 06 Aug 2026 12:03:12 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158678ec37sm30465262eec.23.2026.08.06.12.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 12:03:12 -0700 (PDT)
Message-ID: <336f3945-75bb-4cba-8565-063384020672@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 00:33:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/14] i3c: master: Add helper to query bus wakeup
 requirements
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-11-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806131857.119830-11-adrian.hunter@intel.com>
X-Proofpoint-GUID: qKMBZDcl1cH_ct4S3Q7HlwoX20g8cEPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0OSBTYWx0ZWRfX/3CdifKMgB/1
 44fxH06Is5ea6pG2vLUpe6Ke9CLAi6AK6QS8IubwYedoDM4aaqiB7VJkCX3jV0JwqYniaxNAKXr
 TQrSNPPyaerPDXorQ/QyUT4XzaAWsTOdOY1FwxBMv0rzIwyAlEBvqbAUFNGJw63JHSq1GRBZFQ0
 VWRHjVoluMx9pHdkmej22ibVcu8xrGxOhrEF/YBh34JAY3ZGCekuPVPN5JtYYXzRZr7+4QNFCIM
 AbmLum21AGWviHJWKxwaZMp19ViYIJ4QK/2E5evHiKJ+is9t1UbtsHkUI9ORMhw7clY0cmFALLG
 OVOVaLkl4uTmNuoYjJ03wJY9OiXqMoYZHnLMfTEsaWibjKZqaqmX2YhvE4hDI0l/WQ7AEovuBzf
 IIZcsy2w02x2Zm8wwHP6ufaGzQyU0ENVh6gUs9itvkdKH4KdmWYRhOnTGiIXb+8+E8+uQOwXwjg
 IV1AuQfpX/sjG8uMH9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0OSBTYWx0ZWRfXyfZ5i20S9p6L
 A3koyQqgTOupWLi3EX+qlVhd4MeYISoJOyqHAQDBqZnqyXnJ2SJ8/5/0MLecq7BjWjYyIi6xiL2
 8V7+b7imxHmGCgr04DGDWxZWWOvCh7A=
X-Proofpoint-ORIG-GUID: qKMBZDcl1cH_ct4S3Q7HlwoX20g8cEPy
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a74da72 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ir2BDiqAYjbXK5kd3AEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_120315_600577_505B874B 
X-CRM114-Status: UNSURE (   9.19  )
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



On 8/6/2026 6:48 PM, Adrian Hunter wrote:
> Add i3c_master_has_wakeup_enabled_devs(), which iterates over the devices
> on an I3C bus and reports whether any of them are enabled for system
> wakeup and have IBI enabled.
> 
> Controller drivers can use this helper to determine whether wakeup
> support must remain available while the system is suspended.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
