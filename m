Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD1AC54756
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUH3pZLORAI7rsvI/IeyMvG799rbjYOs1NsBUO7bIoM=; b=IbzImXVclLWv68
	Zk1xfbn8+nY1Fz7JbCm5zkyB39eDtyR6PJaq/8HuV6jaP+8QVpepv26o26BNTVm2Tmwuylni1wG+3
	FRY/rJ0wbdL2FzhHi+mXdcYxbSeADljpqcU3crP7RHt6tjt9OHZ3kzJrdqvvZh5Br0BuCJrBDigEl
	TBpALaOPjBU9NTkwst7HsaLyRlMcTL+Mm5FzTbiCpj3EaSLxeA7mSA+U50kFismx4Mf/gZN+PFnym
	+N7gCQuTA0Ac8v5JiNkrYIjoVShZGSTRAI7RYhSn7g0od2oa89vyaVaAIrsBVF+dNOTAVxKXRYCYD
	nvTB3oN/oNgGwJa4Cacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUla-000000008Sk-3BDO;
	Thu, 15 May 2025 09:20:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GE4-00000001I2S-3HAk
	for linux-i3c@lists.infradead.org;
	Mon, 14 Apr 2025 09:35:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99r6Z013121
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 09:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=; b=ETFusTqNjdq4ABEC
	WAKtgLVwVAtkZgejfF2NJRNMxFe+9lI/NCRVtl8WmFl2PreOF4aNJN+WaANE7sQS
	mpIBParMdhMQl2lD33EkDhamQmF/5qUxZhsduus/IW+KIcGeyxEhjnhQw1zM66Pk
	YT2LExOgMpjKGSd6Y0zd86xUpBsYaXNOomNfVbaL4dUq9huIHUv7907/DEICpae+
	SOzrwevx5XfzbvmPxUdbNpvZkdVOOR93VAbx+KCYrumMy0tF1HZS96yvgJP1gJ4Q
	coD8QTyz2K3WZnR6uqtLxIi9uneDx4jifuzkGofeHBg7q4yKphWVmK8ZmYGwSMTV
	PInTHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj941c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 09:35:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-477608e8e4aso4286611cf.1
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 02:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623335; x=1745228135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=;
        b=sVyGzK1yjFJu8vbqkmP4hqkHQ1h3d7ROXSQlsm5xY8g7Vf8SXX6A2oKTKwtqamYDzE
         1WMvDJtfEjiMNIt0A9ZmAKnMhucLNTh6y74cXeFbxEFs8mgCzrEwlOI3j1NsqcpVHnWR
         tsmfWwyp2cTUgeLwXC6WwITYrdA1EH9+DpVAD+qEi38H8TG60Yj7DO7jLvb7WG06K89Z
         b/i4DiX8KDIZsd+ubMvuPG/Ls1fTvjhCGKyB+fgNq6JyihhkXzV2aJJiuI/LSvMSuFFB
         P71r8IYAAl4yv5LEi0I30ACmnZIe3JU2C/GQHsj6FhH/leKGddeQGjLL6naw4NiS+EW1
         5aig==
X-Forwarded-Encrypted: i=1; AJvYcCWEQaX49PhuD/pzZS2KsLUwOILcgeU9hg/dQRbREH3oaCuOhbAQXwtw5Axd+/LD15hchLKttAoPlWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDa7D9oMiACBCrOzqHeDyMXM6QQfD1mo58ZCkdzco+Ts7eWpB
	zLrOYzRe7OfL4bbHR9URpkUTtMK4ySr8vj6FF8/nqoi77oQjFnGkE1nmqt4whDmyhGAhUsU+q5m
	Pl2maUQ348JKu617Q4i8n5pqlDk0D5A/ic2jBXsd7NetOMpO8h8dEMiTF+xO+Lncj
X-Gm-Gg: ASbGnctM2Ea5KFUIbXEJx6tKMH7n5j+m+lCSJtk53bByTNPQJ7KFFsKQHf9/EJYHc8o
	gmzXhUmveFzSCxJ+r8unIAFABIj5UDF7jeowJZtSug1QGwIs1lkr37AohqxnsrpOMOe28lMVp66
	piw4Yf2r1MvMvMyKa0HtzN2/LaF8oOO7gbLR3H/ZmrCqXy75nGL2zzrlZYOq/12YQdjfsjssZRd
	L7toSULpilt0GfI5uDrqD9i5EXEypBdqYijKeVSqOQqN8raXGLQXl6N+APsrgZHT+9smuQgxqrE
	yoBU7Y207twbn9j5gQc+PKlhA7FZkJIdkyJTHVCr2naGAZgwKuXzGrS05p/ed8Gvqw==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58692991cf.12.1744623334630;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR7OOhzKBYdqfK0VGxmo2VmGX5JzFnkfE/jbhggTTeP0zQwuMsoYljOwnrtUWZc3+eFjP26Q==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58692871cf.12.1744623334094;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06a2c3sm4643959a12.40.2025.04.14.02.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:35:33 -0700 (PDT)
Message-ID: <91babf0d-d461-4a28-bc1e-54711a2094d1@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:35:31 +0200
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
 <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
X-Proofpoint-ORIG-GUID: 5IhVpBHaEA_iDqyE3LVTAmDFxA47N2Wo
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcd6e7 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=p_wr6ghfAju7psezmTgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5IhVpBHaEA_iDqyE3LVTAmDFxA47N2Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=926
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_023536_945424_26663F79 
X-CRM114-Status: GOOD (  26.65  )
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

T24gNC8xNC8yNSA3OjUxIEFNLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6Cj4gVGhhbmtz
IEtvbnJhZCBmb3IgZGV0YWlsZWQgcmV2aWV3Lgo+IAo+IAo+IE9uIDQvMTIvMjAyNSA0OjQ1IEFN
LCBLb25yYWQgRHliY2lvIHdyb3RlOgo+PiBPbiA0LzExLzI1IDE6MzUgUE0sIE11a2VzaCBLdW1h
ciBTYXZhbGl5YSB3cm90ZToKPj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgUXVhbGNvbW0gSTNDIGNv
bnRyb2xsZXIgZHJpdmVyLCB3aGljaCBpbXBsZW1lbnRzCj4+PiBJM0MgbWFzdGVyIGZ1bmN0aW9u
YWxpdHkgYXMgZGVmaW5lZCBpbiB0aGUgTUlQSSBBbGxpYW5jZSBTcGVjaWZpY2F0aW9uCj4+PiBm
b3IgSTNDLCBWZXJzaW9uIDEuMC4KPj4+Cj4+PiBUaGlzIGRyaXZlciBzdXBwb3J0cyBtYXN0ZXIg
cm9sZSBpbiBTRFIgbW9kZS4KPj4+Cj4+PiBVbmxpa2Ugc29tZSBvdGhlciBJM0MgbWFzdGVyIGNv
bnRyb2xsZXJzLCB0aGlzIGltcGxlbWVudGF0aW9uCj4+PiBkb2VzIG5vdCBzdXBwb3J0IEluLUJh
bmQgSW50ZXJydXB0cyAoSUJJKSBhbmQgSG90LWpvaW4gcmVxdWVzdHMuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogTXVrZXNoIEt1bWFyIFNhdmFsaXlhIDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29t
Pgo+Pj4gLS0tCgpbLi4uXQoKPj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBnZW5pX2kzY19kZXYg
KnRvX2dlbmlfaTNjX21hc3RlcihzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICptYXN0
ZXIpCj4+PiArewo+Pj4gK8KgwqDCoCByZXR1cm4gY29udGFpbmVyX29mKG1hc3Rlciwgc3RydWN0
IGdlbmlfaTNjX2RldiwgY3RybHIpOwo+Pj4gK30KPj4KPj4gI2RlZmluZSBpbnN0ZWFkCj4+Cj4g
aSBzZWUgYWxsIGkzYyB2ZW5kb3JzIGFyZSB1c2luZyBzYW1lIGRlZmluaXRpb25zLCBzbyBmb3Ig
bm93IGNhbiB3ZSBrZWVwIGl0IHNpbWlsYXIgd2F5IGlmIGl0J3MgbWlub3IgPwoKcG90YXl0by9w
b3RhaHRvLCBsZXQncyBrZWVwIGl0IGFzIGlzCgoKPj4+ICtzdGF0aWMgaW50IF9pM2NfZ2VuaV9l
eGVjdXRlX2NvbW1hbmQoc3RydWN0IGdlbmlfaTNjX2RldiAqZ2kzYywgc3RydWN0IGdlbmlfaTNj
X3hmZXJfcGFyYW1zICp4ZmVyKQo+Pj4gK3sKPj4+ICvCoMKgwqAgYm9vbCBpc193cml0ZSA9IGdp
M2MtPmN1cl9pc193cml0ZTsKPj4+ICvCoMKgwqAgZG1hX2FkZHJfdCB0eF9kbWEgPSAwLCByeF9k
bWEgPSAwOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIHRpbWVfcmVtYWluaW5nOwo+Pj4gK8Kg
wqDCoCB1MzIgbGVuID0gZ2kzYy0+Y3VyX2xlbjsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+ICsK
Pj4+ICvCoMKgwqAgZ2VuaV9zZV9zZWxlY3RfbW9kZSgmZ2kzYy0+c2UsIHhmZXItPm1vZGUpOwo+
Pj4gKwo+Pj4gK8KgwqDCoCBnaTNjLT5lcnIgPSAwOwo+Pj4gK8KgwqDCoCBnaTNjLT5jdXJfaWR4
ID0gMDsKPj4+ICsKPj4+ICvCoMKgwqAgaWYgKCFpc193cml0ZSkgewo+Pgo+PiBOaXQ6IGlmIChp
c193cml0ZSkge30gLi4gZWxzZSB7fSBpcyBtb3JlIG5hdHVyYWw+ICvCoMKgwqDCoMKgwqDCoCBk
ZXZfZGJnKGdpM2MtPnNlLmRldiwgIkkzQyBjbWQ6MHgleCBwYXJhbToweCV4IFJFQUQgbGVuOiVk
XG4iLAo+IFN1cmUsIFJldmVyc2VkIHdpdGggbmF0dXJhbCBhbmQgcG9zaXRpdmUgY2hlY2suCj4g
SSBkaWRuJ3QgZ2V0IGFib3V0IGRlYnVnIGxvZyBzdWdnZXN0aW9uLiBEbyB5b3Ugd2FudCB0byBv
cHRpbWl6ZSBpdCB0byBvbmUgZm9yIGJvdGggaWYvZWxzZSBjb25kaXRpb24gPwoKT2ggbm8gdGhh
dCdzIG1lIGZpZ2h0aW5nIHdpdGggYSBidWcgaW4gdGh1bmRlcmJpcmQgYWRkaW5nIHJhbmRvbSBu
ZXdsaW5lcwp0byBteSBtZXNzYWdlLi4gSSBvbmx5IG1lYW50IHRoZSBpZi1jb25kaXRpb24KCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZmVyLT5tX2NtZCwgeGZlci0+bV9wYXJhbSwgbGVu
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWxfcmVsYXhlZChsZW4sIGdpM2MtPnNlLmJhc2Ug
KyBTRV9JM0NfUlhfVFJBTlNfTEVOKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5pX3NlX3NldHVw
X21fY21kKCZnaTNjLT5zZSwgeGZlci0+bV9jbWQsIHhmZXItPm1fcGFyYW0pOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmICh4ZmVyLT5tb2RlID09IEdFTklfU0VfRE1BKSB7Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSBnZW5pX3NlX3J4X2RtYV9wcmVwKCZnaTNjLT5zZSwgZ2kzYy0+
Y3VyX2J1ZiwgbGVuLCAmcnhfZG1hKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChy
ZXQpIHsKPj4gV2h5IHdvdWxkIGl0IGZhaWw/IEFuZCB3aHkgc2hvdWxkIHdlIGZhbGwgYmFjayBz
aWxlbnRseSB0byBGSUZPIG1vZGUgdGhlbj8KPj4KPiBETUEgbWFwcGluZyBjYW4gZmFpbCBPUiBp
bnB1dCB2YWxpZGF0aW9uIGNhbiBhbHNvIGZhaWwuIFNvIHdlIHdhbnQgdG8gY29udGludWUgd2l0
aCBGSUZPIG1vZGUuCgoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGZlci0+
bW9kZSA9IEdFTklfU0VfRklGTzsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z2VuaV9zZV9zZWxlY3RfbW9kZSgmZ2kzYy0+c2UsIHhmZXItPm1vZGUpOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqAgfSBlbHNl
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGdpM2MtPnNlLmRldiwgIkkzQyBjbWQ6MHgl
eCBwYXJhbToweCV4IFdSSVRFIGxlbjolZFxuIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHhmZXItPm1fY21kLCB4ZmVyLT5tX3BhcmFtLCBsZW4pOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHdyaXRlbF9yZWxheGVkKGxlbiwgZ2kzYy0+c2UuYmFzZSArIFNFX0kzQ19UWF9UUkFOU19M
RU4pOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdlbmlfc2Vfc2V0dXBfbV9jbWQoJmdpM2MtPnNlLCB4
ZmVyLT5tX2NtZCwgeGZlci0+bV9wYXJhbSk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KHhmZXItPm1vZGUgPT0gR0VOSV9TRV9ETUEpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldCA9IGdlbmlfc2VfdHhfZG1hX3ByZXAoJmdpM2MtPnNlLCBnaTNjLT5jdXJfYnVmLCBsZW4s
ICZ0eF9kbWEpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZmVyLT5tb2RlID0gR0VOSV9TRV9GSUZPOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZW5pX3NlX3NlbGVjdF9tb2RlKCZn
aTNjLT5zZSwgeGZlci0+bW9kZSk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICh4ZmVyLT5tb2Rl
ID09IEdFTklfU0VfRklGTyAmJiBsZW4gPiAwKSAvKiBHZXQgRklGTyBJUlEgKi8KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlbF9yZWxheGVkKDEsIGdpM2MtPnNlLmJhc2UgKyBTRV9H
RU5JX1RYX1dBVEVSTUFSS19SRUcpOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIHRp
bWVfcmVtYWluaW5nID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZnaTNjLT5kb25lLCBY
RkVSX1RJTUVPVVQpOwo+Pj4gK8KgwqDCoCBpZiAoIXRpbWVfcmVtYWluaW5nKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBkZXZfZGJnKGdpM2MtPnNlLmRldiwgIlRpbWVvdXQgY29tcGxldGluZyBGSUZPIHRyYW5zZmVy
XG4iKTsKPj4KPj4gQ2FuIGl0IG5vdCBiZSBETUEgbW9kZSBoZXJlIHRvbz8KPj4KPiBHb29kIGZp
bmQsIGl0J3MgY29tbW9uIHRpbWVvdXQgZXJyb3IuIFJlbW92ZWQgRklGTyB3b3JkLgo+PiBbLi4u
XQo+Pgo+Pj4gK3N0YXRpYyB2b2lkIGdlbmlfaTNjX3BlcmZvcm1fZGFhKHN0cnVjdCBnZW5pX2kz
Y19kZXYgKmdpM2MpCj4+PiArewo+Pj4gK8KgwqDCoCB1OCBsYXN0X2R5bl9hZGRyID0gMDsKPj4+
ICvCoMKgwqAgaW50IHJldDsKPj4+ICsKPj4+ICvCoMKgwqAgd2hpbGUgKDEpIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoCB1OCByeF9idWZbOF0sIHR4X2J1Zls4XTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZ2VuaV9pM2NfeGZlcl9wYXJhbXMgeGZlciA9IHsgR0VOSV9TRV9GSUZPIH07Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGkzY19kZXZpY2VfaW5mbyBpbmZvID0geyAwIH07Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGkzY19kZXZfZGVzYyAqaTNjZGV2Owo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGJvb2wgbmV3X2RldmljZSA9IHRydWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgdTY0IHBp
ZDsKPj4+ICvCoMKgwqDCoMKgwqDCoCB1OCBiY3IsIGRjciwgYWRkcjsKPj4+ICsKPj4+ICvCoMKg
wqDCoMKgwqDCoCB4ZmVyLm1fY21kID0gSTJDX1JFQUQ7Cj4+PiArwqDCoMKgwqDCoMKgwqAgeGZl
ci5tX3BhcmFtID0gU1RPUF9TVFJFVENIIHwgQ09OVElOVU9VU19NT0RFX0RBQSB8IFVTRV83RTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBpM2NfZ2VuaV9leGVjdXRlX3JlYWRfY29tbWFuZChn
aTNjLCAmeGZlciwgcnhfYnVmLCA4KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAg
ZGNyID0gcnhfYnVmWzddOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJjciA9IHJ4X2J1Zls2XTsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBwaWQgPSAoKHU2NClyeF9idWZbMF0gPDwgNDApIHwKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICgodTY0KXJ4X2J1ZlsxXSA8PCAzMikgfAo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKCh1NjQpcnhfYnVmWzJdIDw8IDI0KSB8Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoKHU2NClyeF9idWZbM10gPDwgMTYpIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICgodTY0KXJ4X2J1Zls0XSA8PMKgIDgpIHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICgodTY0KXJ4X2J1Zls1XSk7Cj4+Cj4+IEZJRUxEX1BSRVAgKyBHRU5NQVNLLCBwbGVhc2UK
Pj4KPiBTdXJlLCBEb25lLgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGkzY19idXNfZm9yX2Vh
Y2hfaTNjZGV2KCZnaTNjLT5jdHJsci5idXMsIGkzY2Rldikgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaTNjX2RldmljZV9nZXRfaW5mbyhpM2NkZXYtPmRldiwgJmluZm8pOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBpZCA9PSBpbmZvLnBpZCAmJiBkY3IgPT0gaW5mby5k
Y3IgJiYgYmNyID09IGluZm8uYmNyKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5ld19kZXZpY2UgPSBmYWxzZTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYWRkciA9IChpbmZvLmR5bl9hZGRyKSA/IGluZm8uZHluX2FkZHIgOgo+Pgo+PiBhZGRyID0g
aW5mby5keW5fYWRkciA/OiBpbmZvLnN0YXRpY19hZGRyOwo+Pgo+IFllcywgRG9uZS4KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZvLnN0YXRpY19hZGRyOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKG5ld19kZXZpY2UpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IGkzY19tYXN0ZXJfZ2V0X2ZyZWVfYWRkcigmZ2kzYy0+Y3RybHIsIGxhc3RfZHluX2FkZHIgKyAx
KTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGFkZHIgPSAodTgpcmV0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9keW5fYWRk
ciA9ICh1OClyZXQ7Cj4+Cj4+IG5pdDogd2hpbGUgbG9naWNhbGx5IHRoZSBzYW1lLCBsYXN0X2R5
bl9hZGRyID0gYWRkciB3b3VsZCBtYWtlIHNlbnNlIGhlcmUKPj4KPiBTdXJlLCBEb25lLgo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X25ld19hZGRyX3Nsb3QoZ2kzYy0+bmV3YWRkcnNs
b3RzLCBhZGRyKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+PiArCj4+Cj4+IHN1cHBvc2UgYWRk
cj0weDM4Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqAgdHhfYnVmWzBdID0gKGFkZHIgJiBJM0NfQURE
Ul9NQVNLKSA8PCAxOwo+Pgo+PiB0eF9idWZbMF0gPSAoMHgzOCAmIDB4N2YpIDw8IDEgPSAweDM4
PDwxID0gMHg3MCA9IDBiMTExMDAwMAo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIHR4X2J1ZlswXSB8
PSB+KGh3ZWlnaHQ4KGFkZHIgJiBJM0NfQUREUl9NQVNLKSAmIDEpOwo+Pgo+PiAweDcwIHwgfiho
d2VpZ2h0OCgweDcwICYgMHg3ZikgJiAxKSA9IDB4NzAgfCB+KDMgJiAxKSA9IDB4NzAgfCB+QklU
KDApID0gMHhmZQo+Pgo+PiBpcyB0aGF0IHRoZSBpbnRlbmRlZCByZXN1bHQ/Cj4+Cj4gWWVzLCB0
aGF0cyByaWdodC4KPiBJdCBjYW4gaGF2ZSBlaXRoZXIgMHhmZSBPUiAweGZmLgo+IAo+IE1haW5s
eSBmb3IgZXJyb3IgZGV0ZWN0aW9uIHB1cnBvc2UuIFRoaXMgcGFyaXR5IGJpdCBpbiB0eF9idWZb
MF0gaXMgc2V0IGNvcnJlY3RseSBiYXNlZCBvbiBub3Mgc2V0IGJpdHMgaW4gdGhlIE1hc2tlZCBh
ZGRyIGlzIG9kZCBvciBldmVuLgo+IEkgaGF2ZSBzaW1wbGlmaWVkIGl0IHVzaW5nIHBhcml0eTgo
KS4KCk9LLCBuaWNlCgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHhmZXIubV9jbWQgPSBJMkNf
V1JJVEU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgeGZlci5tX3BhcmFtID0gU1RPUF9TVFJFVENIIHwg
QllQQVNTX0FERFJfUEhBU0UgfCBVU0VfN0U7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gaTNjX2dlbmlfZXhlY3V0ZV93cml0ZV9jb21tYW5kKGdpM2MsICZ4ZmVyLCB0eF9idWYsIDEp
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+ICvCoMKgwqAgfQo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW50IGdlbmlf
aTNjX21hc3Rlcl9zZW5kX2NjY19jbWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSwK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaTNjX2Nj
Y19jbWQgKmNtZCkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBnZW5pX2kzY19kZXYgKmdpM2Mg
PSB0b19nZW5pX2kzY19tYXN0ZXIobSk7Cj4+PiArwqDCoMKgIGludCBpLCByZXQ7Cj4+PiArCj4+
PiArwqDCoMKgIGlmICghKGNtZC0+aWQgJiBJM0NfQ0NDX0RJUkVDVCkgJiYgY21kLT5uZGVzdHMg
IT0gMSkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+ICsKPj4+ICvCoMKg
wqAgcmV0ID0gaTNjX2dlbmlfcnVudGltZV9nZXRfbXV0ZXhfbG9jayhnaTNjKTsKPj4+ICvCoMKg
wqAgaWYgKHJldCkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gKwo+Pj4gK8Kg
wqDCoCBxY29tX2dlbmlfaTNjX2NvbmYoZ2kzYywgT1BFTl9EUkFJTl9NT0RFKTsKPj4+ICvCoMKg
wqAgZm9yIChpID0gMDsgaSA8IGNtZC0+bmRlc3RzOyBpKyspIHsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBpbnQgc3RhbGwgPSAoaSA8IChjbWQtPm5kZXN0cyAtIDEpKSB8fAo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKGNtZC0+aWQgPT0gSTNDX0NDQ19FTlREQUEpOwo+Pgo+PiBib29sCj4+Cj4g
U29ycnksIERpZG4ndCBnZXQgaXQgd2hlcmUgdG8ga2VlcCBib29sID8KCkkgYmxhbWUgdGh1bmRl
cmJpcmQgYWdhaW4sIEkgY2FuJ3QgZmluZCB3aGF0IEkgbWVhbnQsIGl0J3MgcHJvYmFibHkKbm90
IHN1cGVyIGltcG9ydGFudAoKS29ucmFkCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
