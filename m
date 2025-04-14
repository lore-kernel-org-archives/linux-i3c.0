Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC37C369B2
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Apr 2025 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UydoFlUX6PYMwN7RDGxcCmRU/lskQCSZ0SNTqIEoCYM=; b=kiertPs7TY+ep2
	/MOhiMOsbLSTGWJ5uzp6ejJy8ErqJtzOT6EdI6FqKL8Q2x7XvChmIoNKKrbVEZxF/vKGuMsc4Mynw
	LAbW7ghB+4babWGbxLUMcDNjlbdkVp+/0mjUcTdHkveAzcoTLMqX61rAfnmR5x1H72daaT2YUDLMD
	ITt4IkgqWrKuc2pQ4SzPwsNdz/IXRLfA1d6nFttZoReEiMjKDQ8sPRhr+SHru7cUo84P9U1tdGRYE
	6nide1qtaW5rzQeDOToRGb2fWZ9j/ooMvikrL6UrDen1gKTDyG6p2wyhqtWmQmfaEMW+mIk97976I
	81vi11UwrE8Wkc/JXGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HCq-00000001ZpW-2Qfe;
	Mon, 14 Apr 2025 10:38:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GwM-00000001Uhk-1o5L
	for linux-i3c@lists.infradead.org;
	Mon, 14 Apr 2025 10:21:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qZP002941;
	Mon, 14 Apr 2025 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asXEFEGh2xmSnnabSs+R4EMdR9kS4bNu32eSF31rOxs=; b=TQzfkT61IoZJX//C
	5uBkqdey1/PbCT9H9CoYozovAUWf2f1tEUnqnM7NZamvspeckfYunWcolZtxYobq
	H7MAJqzfDFo5QfZbCQvOQZWJMsCrllXV+Eax+eOZgCaqm3udrtQH/P6fFhBmXAIO
	jxEKa2QNiAxM3MFb/gUiUH5BZUq/m8QkCHUaGVZxf6pR8YruBSHWVUItUMU68FhN
	UNneS1rSHnWk/ZCumd+fBRBrtehONnQzaEWOsAqdze/W7JqjyURrTj8ywYeDuPVB
	JuzHKHG5Eg2KJPCUjuXFZyKRcWqgdLeVYUqhgvfjgWDMfcRYaej0jE/5N54d0KXv
	j9EZ3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpm1xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:21:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EALECa005759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:21:14 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:21:10 -0700
Message-ID: <c6ea9f41-151a-4b42-beb6-d657672489e8@quicinc.com>
Date: Mon, 14 Apr 2025 15:51:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <bca32a29-23c7-446f-9307-cc36d3f1ee44@quicinc.com>
 <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <518663e1-8bed-46b6-95dd-142b98e567b3@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BZUYe86G6FZb8OqomLIh0u4eRLEh9oHK
X-Proofpoint-GUID: BZUYe86G6FZb8OqomLIh0u4eRLEh9oHK
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fce19b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=erseW_yTxJpY10KdARoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=844 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032122_474047_7ECDD641 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzE0LzIwMjUgMzozOCBQTSwgS29ucmFkIER5YmNpbyB3cm90ZToKPiBPbiA0LzE0LzI1
IDEwOjUzIEFNLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6Cj4+IEhpIEtvbnJhZCwgcmVz
cG9uZGluZyB0byBvbmUgY29tbWVudCB3aGljaCBpcyBub3Qgd29ya2luZyBhcyBzdWdnZXN0ZWQg
YnkgeW91Lgo+Pgo+PiBPbiA0LzEyLzIwMjUgNDo0NSBBTSwgS29ucmFkIER5YmNpbyB3cm90ZToK
Pj4+IE9uIDQvMTEvMjUgMTozNSBQTSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIHdyb3RlOgo+Pj4+
IEFkZCBzdXBwb3J0IGZvciB0aGUgUXVhbGNvbW0gSTNDIGNvbnRyb2xsZXIgZHJpdmVyLCB3aGlj
aCBpbXBsZW1lbnRzCj4+Pj4gSTNDIG1hc3RlciBmdW5jdGlvbmFsaXR5IGFzIGRlZmluZWQgaW4g
dGhlIE1JUEkgQWxsaWFuY2UgU3BlY2lmaWNhdGlvbgo+Pj4+IGZvciBJM0MsIFZlcnNpb24gMS4w
Lgo+Pj4+Cj4+Pj4gVGhpcyBkcml2ZXIgc3VwcG9ydHMgbWFzdGVyIHJvbGUgaW4gU0RSIG1vZGUu
Cj4+Pj4KPj4+PiBVbmxpa2Ugc29tZSBvdGhlciBJM0MgbWFzdGVyIGNvbnRyb2xsZXJzLCB0aGlz
IGltcGxlbWVudGF0aW9uCj4+Pj4gZG9lcyBub3Qgc3VwcG9ydCBJbi1CYW5kIEludGVycnVwdHMg
KElCSSkgYW5kIEhvdC1qb2luIHJlcXVlc3RzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTXVr
ZXNoIEt1bWFyIFNhdmFsaXlhIDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPgo+Pj4+IC0tLQo+
IAo+IFsuLi5dCj4gCj4+Pj4gK8KgwqDCoCBpZiAoKG1fc3RhdCAmCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIChNX1JYX0ZJRk9fV0FURVJNQVJLX0VOIHwgTV9SWF9GSUZPX0xBU1RfRU4pKSAmJgo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAhZ2kzYy0+Y3VyX2lzX3dyaXRlICYmIGdpM2MtPmN1cl9idWYpIHsK
Pj4+Cj4+PiBUaGUgaW5kZW50YXRpb24gaGVyZSBpcyBjb25mdXNpbmcsIHBsZWFzZSBhbGlnbiB0
aGUgYChNX1JYLi5gIHdpdGggYG1fc3RhdCAmYAo+PiBJIGhhdmUgdHJpZWQgdG8gaW1wbGVtZW50
IHRoaXMsIGJ1dCBhbHdheXMgZ2l2aW5nIG1lIHdhcm5pbmcgYXMgYmVsb3cuCj4+IFRyaWVkIG1h
bnkgd2F5cywgYnV0IHNhbWUgaXNzdWUsIGhlbmNlIGtlZXBpbmcgaXQgbGlrZSB0aGlzLgo+PiBJ
biBmYWN0LCBlYXJsaWVyIGFsc28gaSBmYWNlZCBzYW1lIGlzc3VlIGhlbmNlIGkgd3JvdGUgaXQg
dGhpcyB3YXkuCj4+Cj4+IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50
aGVzaXMKPj4gIzQ2ODogRklMRTogZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1xY29tLWdlbmkuYzo0
MDU6Cj4+ICvCoMKgwqDCoMKgwqAgaWYgKChtX3N0YXQgJiAoTV9SWF9GSUZPX1dBVEVSTUFSS19F
TiB8IE1fUlhfRklGT19MQVNUX0VOKSkgJiYKPiAKPiAKPiBNYXliZSBsZXQncyBkZWZpbmUgc29t
ZXRoaW5nIGxpa2UKPiAKPiBib29sIGh3X3BlbmRpbmdfcmVhZCA9IG1fc3RhdCAmIE1fUlguLi4K
PiAKU3VyZSwgdGhhdCB3b3VsZCBkby4gV2lsbCB1cGRhdGUgaW4gVjUuCj4gS29ucmFkCgoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
