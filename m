Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DB3C54754
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjUSLIAOHcgrtoNourKYpVh2xve6VDkx95hfJm35gpo=; b=I6rtHZ2dYl5BwD
	VDqU1/wSha0+9YR6iqAiVfsudsClVRf/M6L+bZoGaXqrtl7qHCGKiSmjql9GYIZrPc0Ib3tmBm7Lj
	zEjoiTx5i8GsQW8l/+FyfuZUZCA4xeVSFTyu/6hnynY2DgVyA1HonPsqYqdaNA3bRxHE2ByPAdTT2
	GSR6FKEu3pyiQ9tfJ3aJcGCNQN16wvIQo/rWjVrkfbWfkgjkPzOXcDWcUgFFs0OK6jt9mYo9gluyo
	ePB6ykfo4SJWNqccJSn7Zjl4DecXET3GN+nmqpHRVxHhHUgBfNLI1yqV5gM6zHyD9rN+PEmNtIIua
	41fdIaLxq8ZOCOkGtJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlb-000000008TX-0yJd;
	Thu, 15 May 2025 09:20:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gji-00000001Q9k-10JI
	for linux-i3c@lists.infradead.org;
	Mon, 14 Apr 2025 10:08:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qjk002933
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 10:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=; b=d3qSA8SzB23MwR0Z
	kugFKL/fCG92rdQklMzld68n3xq07ZCHMjKFg3VeF6lcQsVxozg3RVfoEwp2IDSG
	k9Qi1/2NoCiTqJfHgGGhNziDLVA0N+aKI4CH0AeyKwKXsIv7qnyQySBDSV1XN+vq
	0lld2uAkOkcE9V4fSgs7cZWqkFK+PvPXtVjKhLh57fY265TJnjU5LzstR+ec6DH7
	CXtFFD/fdEIAYbLiYxuuDJGQv2OQCh5KS+CsAKvTuI7MNRDDph9dndyRtgTWV4ia
	nETdspqGFOA7Vp7Vs/PFbEXTBjWY1z1JAD4bFdmgePRVQ3NyeR3nvhyqEzCDOoBW
	p0pSTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpm0ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 10:08:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4775bdbcdc3so8237991cf.2
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625296; x=1745230096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAPOu8FTHZQiUawy5teQOSK8iVJhCxgNvfNjhCFVeS8=;
        b=AZgZ8ZB7ZMWBxWbpteEVle+KIuahq3hl2xteR6YTPUlBAVuRHD/MN0QUAOaf5W+RwA
         tlIk+G30amOni4FdLcNPL/q4WGnVBNvnazbZNtSwKYedOIURHH1xHpdAOnkdhSQQN/ZU
         hZu61IEwSsSxIg9v3gaLR1HW6i55L47F1b4HstkdjV9LESVc4gcQlj6tvtCQVb5jjyv2
         lUQjfMzeRWts4ZNtwpBW6vhekEbSSPWe1TNGNxM8yGEE8naqC2j8l7O+lV4jBpCskKhA
         Oj5xTPEUD1qoxey6c/Vz3HlJh/82CYedJb3nWKNgjkw9CsHQIKjvZGihbaqJZt74S5W6
         ol4g==
X-Forwarded-Encrypted: i=1; AJvYcCX/rUrCXOlzo3NkeQOIYB8VJC/QV9/10XdEmAqEgKMwGozyPNX2atC3EhY6fVwJ2JKDX8Gh5wQYF4g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3rNFKJvnR+f+GIMUCWnaDDgXCYHKsMrRCZiZV1fu4SnTaplVG
	dVUN9XfObMccH6DGBoajxXxamQEj6YbCIOm4fF3lrL+Yn+GC0nuykpc1HRA8mmFFXfrf8SPRkTL
	fhubDKO9sLjFCNkCUE63hJhttxZCm4CG5mG1j1wFs058k9FpvXbLHA7ZzGfQZlDJg
X-Gm-Gg: ASbGnctnBmdzR32Ack2oanOEtgmC6fBr8TV1+Xg1yLOtymrFSE8rO2RhWGl7Fc6i4cx
	QTTLQ2oZ8wSSKYqAnZWR80uGNTIYGpPAnqfkWpX3QRcFIipBQGkFtyBk+7ozLRSt2rQrH8GJebl
	KL19U+L0LXHZuB9410DHXvqPAvDFSSA9EE+MYCQ20jtkWyawmUMnIwulRfbJJglQ3OHIvXffmn6
	J50eJEw6XSfqkjlgUtJr0+1W7bhZ01VWFvm1QNIaF4GPQYLGeXWkeISsLPSuRBafazN+Gn6DNAd
	+9Zic/N43nVHH45U4mhDWRmWwF8tUGlHQAtqROSIsfGT2w9cvJVK74hekP/k0dIUmQ==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640417485a.3.1744625296292;
        Mon, 14 Apr 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkIZWUYjPc9DMV0+IzC+9l1y0nHMActJ4TmxNbh2ot2IBhc4gOyrgI/EtejUkizlU/wxPYNA==
X-Received: by 2002:a05:620a:d8a:b0:7c5:6fee:1634 with SMTP id af79cd13be357-7c7af0c1fc0mr640415285a.3.1744625295827;
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd69asm872424966b.159.2025.04.14.03.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:08:15 -0700 (PDT)
Message-ID: <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
X-Proofpoint-ORIG-GUID: Q3I4s1M1uPL75D7t1pakFpWfJlEcVxEl
X-Proofpoint-GUID: Q3I4s1M1uPL75D7t1pakFpWfJlEcVxEl
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fcde91 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=sL-q8L-RPyKcODZA9a4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=876 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_030818_285949_11159458 
X-CRM114-Status: GOOD (  15.28  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gNC8xNC8yNSAxMDo1MyBBTSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIHdyb3RlOgo+IEhpIEtv
bnJhZCwgcmVzcG9uZGluZyB0byBvbmUgY29tbWVudCB3aGljaCBpcyBub3Qgd29ya2luZyBhcyBz
dWdnZXN0ZWQgYnkgeW91Lgo+IAo+IE9uIDQvMTIvMjAyNSA0OjQ1IEFNLCBLb25yYWQgRHliY2lv
IHdyb3RlOgo+PiBPbiA0LzExLzI1IDE6MzUgUE0sIE11a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90
ZToKPj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgUXVhbGNvbW0gSTNDIGNvbnRyb2xsZXIgZHJpdmVy
LCB3aGljaCBpbXBsZW1lbnRzCj4+PiBJM0MgbWFzdGVyIGZ1bmN0aW9uYWxpdHkgYXMgZGVmaW5l
ZCBpbiB0aGUgTUlQSSBBbGxpYW5jZSBTcGVjaWZpY2F0aW9uCj4+PiBmb3IgSTNDLCBWZXJzaW9u
IDEuMC4KPj4+Cj4+PiBUaGlzIGRyaXZlciBzdXBwb3J0cyBtYXN0ZXIgcm9sZSBpbiBTRFIgbW9k
ZS4KPj4+Cj4+PiBVbmxpa2Ugc29tZSBvdGhlciBJM0MgbWFzdGVyIGNvbnRyb2xsZXJzLCB0aGlz
IGltcGxlbWVudGF0aW9uCj4+PiBkb2VzIG5vdCBzdXBwb3J0IEluLUJhbmQgSW50ZXJydXB0cyAo
SUJJKSBhbmQgSG90LWpvaW4gcmVxdWVzdHMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTXVrZXNo
IEt1bWFyIFNhdmFsaXlhIDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPgo+Pj4gLS0tCgpbLi4u
XQoKPj4+ICvCoMKgwqAgaWYgKChtX3N0YXQgJgo+Pj4gK8KgwqDCoMKgwqDCoMKgIChNX1JYX0ZJ
Rk9fV0FURVJNQVJLX0VOIHwgTV9SWF9GSUZPX0xBU1RfRU4pKSAmJgo+Pj4gK8KgwqDCoMKgwqDC
oMKgICFnaTNjLT5jdXJfaXNfd3JpdGUgJiYgZ2kzYy0+Y3VyX2J1Zikgewo+Pgo+PiBUaGUgaW5k
ZW50YXRpb24gaGVyZSBpcyBjb25mdXNpbmcsIHBsZWFzZSBhbGlnbiB0aGUgYChNX1JYLi5gIHdp
dGggYG1fc3RhdCAmYAo+IEkgaGF2ZSB0cmllZCB0byBpbXBsZW1lbnQgdGhpcywgYnV0IGFsd2F5
cyBnaXZpbmcgbWUgd2FybmluZyBhcyBiZWxvdy4KPiBUcmllZCBtYW55IHdheXMsIGJ1dCBzYW1l
IGlzc3VlLCBoZW5jZSBrZWVwaW5nIGl0IGxpa2UgdGhpcy4KPiBJbiBmYWN0LCBlYXJsaWVyIGFs
c28gaSBmYWNlZCBzYW1lIGlzc3VlIGhlbmNlIGkgd3JvdGUgaXQgdGhpcyB3YXkuCj4gCj4gQ0hF
Q0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwo+ICM0Njg6IEZJTEU6
IGRyaXZlcnMvaTNjL21hc3Rlci9pM2MtcWNvbS1nZW5pLmM6NDA1Ogo+ICvCoMKgwqDCoMKgwqAg
aWYgKChtX3N0YXQgJiAoTV9SWF9GSUZPX1dBVEVSTUFSS19FTiB8IE1fUlhfRklGT19MQVNUX0VO
KSkgJiYKCgpNYXliZSBsZXQncyBkZWZpbmUgc29tZXRoaW5nIGxpa2UKCmJvb2wgaHdfcGVuZGlu
Z19yZWFkID0gbV9zdGF0ICYgTV9SWC4uLgoKS29ucmFkCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
