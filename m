Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B3C369B2
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Apr 2025 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44LWvmC/L/XUk2/FIoTYIrBM9Cemk1LSeEItRW3qGl0=; b=L+WHjDLnBP44lT
	0rV6xcPSyfGa2tFDhPqN3ZvyYjsDCerXUCN4fT0PjFwDNFvet6nNavWbd1xDasPMOYFvyZiULcgay
	2cyCKWf39an/dklJNjgKQism5TArfM84QIz53W5MkWOuDlnrY0yHGf96JvhSs3By/B7NrIUYG338Y
	rq9txt5B8mWiOFLfsI4xUmMyczvl4edh8oM+NJ2BUrTiN73yOR/pMHQJ0G0hrEDTkxoNNh6tjxF/E
	sy9WVDEbrT170yrmhiptVoIJoCZp4hfvVdDU0BJuYXclYAN7SyIeHRNF70o0jiZ9mtKT3uQhZW+Yv
	LcItjMLQBMTcEEo1iWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gqc-00000001SuI-445z;
	Mon, 14 Apr 2025 10:15:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gm5-00000001R60-2w05
	for linux-i3c@lists.infradead.org;
	Mon, 14 Apr 2025 10:10:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9A7iZ004753;
	Mon, 14 Apr 2025 10:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPd6RANhdHQovz3xlyW4dKnmJXedwf2HYCGIkivOVyY=; b=N/FqTFklUWvcBdte
	G9EFP+W7eXTksZm0mm940QX4zeu5898RwXTRJXrBMI3BTWoP6pKpTL+ILhn98nN/
	9imYSF9FFuqGOfo+hgsPhCCJcTnIxRJ4OrSTsKrGHRVEXyx9PgIzkUQ2wXPe6FBF
	NW3sIvp4VmbJEv8jvKUmaAm+sLLmDXEGkyJwxhRN0qGWW4+TfCHE31eq4DMcYqST
	CvKvg//U9EWz9Z/Oa4Wi3BfypyzHFKb1EQsOt2WLrtNy9aZVV62oOlF1biwE8gHa
	AbL0pxBsHNaSa8hzS+aafqyovbq03GLWTGCW+e54PXkbSkgw9ZUwNU5iOLiuek8V
	+GxUDg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpm0v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:10:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EAAUef030645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:10:31 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:09:53 -0700
Message-ID: <423f8ae0-259a-4140-94e2-c41f559e2a15@quicinc.com>
Date: Mon, 14 Apr 2025 15:39:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
 <84c07b53-a564-4c71-b172-676303700314@quicinc.com>
 <04ed2ec1-9393-4d02-b7c8-54d6b0aecabc@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <04ed2ec1-9393-4d02-b7c8-54d6b0aecabc@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UE2OyGHsU9JIRpX673lWad_hQJ8D9wbd
X-Proofpoint-GUID: UE2OyGHsU9JIRpX673lWad_hQJ8D9wbd
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fcdf1f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=5eYQsLlqKkl2WO7_BZgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031045_745736_0D47821A 
X-CRM114-Status: GOOD (  11.01  )
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

CgpPbiA0LzE0LzIwMjUgMjo0OCBQTSwgS29ucmFkIER5YmNpbyB3cm90ZToKPiBPbiA0LzEzLzI1
IDk6MjggQU0sIE11a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPj4KPj4KPj4gT24gNC8xMi8y
MDI1IDQ6NTAgQU0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+PiBPbiA0LzExLzI1IDE6MzUgUE0s
IE11a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPj4+PiBUaGlzIHBhdGNoc2V0IGFkZHMgaTNj
IGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgdGhlIHF1YWxjb21tJ3MgUVVQVjMgYmFzZWQKPj4+PiBT
ZXJpYWwgZW5naW5lIChTRSkgaGFyZHdhcmUgY29udHJvbGxlci4KPj4+Pgo+Pj4+IFRoZSBJM0Mg
U0UoU2VyaWFsIEVuZ2luZSkgY29udHJvbGxlciBpbXBsZW1lbnRzIEkzQyBtYXN0ZXIgZnVuY3Rp
b25hbGl0eQo+Pj4+IGFzIGRlZmluZWQgaW4gdGhlIE1JUEkgU3BlY2lmaWNhdGlvbnMgZm9yIEkz
QywgVmVyc2lvbiAxLjAuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoc2V0IHdhcyB0ZXN0ZWQgb24gS2Fp
bHVhIFNNODU1MCBNVFAgZGV2aWNlIGFuZCBkYXRhIHRyYW5zZmVyCj4+Pj4gaGFzIGJlZW4gdGVz
dGVkIGluIEkzQyBTRFIgbW9kZS4KPj4+Pgo+Pj4+IEZlYXR1cmVzIHRlc3RlZCBhbmQgc3VwcG9y
dGVkIDoKPj4+PiAgwqDCoCBTdGFuZGFyZCBDQ0MgY29tbWFuZHMuCj4+Pj4gIMKgwqAgSTNDIFNE
UiBtb2RlIHByaXZhdGUgdHJhbnNmZXJzIGluIFBJTyBtb2RlLgo+Pj4+ICDCoMKgIEkyQyB0cmFu
c2ZlcnMgaW4gUElPIG1vZGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNdWtlc2ggS3VtYXIg
U2F2YWxpeWEgPHF1aWNfbXNhdmFsaXlAcXVpY2luYy5jb20+Cj4+Pj4gLS0tLQo+Pj4+IExpbmsg
dG8gVjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA0MDMxMzQ2NDQuMzkzNTk4
My0xLXF1aWNfbXNhdmFsaXlAcXVpY2luYy5jb20vVC8KPj4+PiB2My0+djQ6Cj4+Pj4gIMKgIC0g
RHJvcHBlZCAiY2xvY2stbmFtZXMiIHByb3BlcnR5IGZyb20gZHQtYmluZGluZ3MgYXMgc3VnZ2Vz
dGVkIGJ5IGtyenlzenRvZi4KPj4+PiAgwqAgLSBNYWtlZmlsZTogQ29ycmVjdCBvcmRlciBzZXF1
ZW5jZSBmb3IgaTNjLXFjb20tZ2VuaS5jLgo+Pj4+ICDCoCAtIEluZGVudGF0aW9uIGNvcnJlY3Rl
ZCBhcm91bmQgcHJpbnQgc3RhdGVtZW50Lgo+Pj4+ICDCoCAtIGdlbmlfaTNjX3Byb2JlKCkgOiBF
eGl0IHdpdGggcmV0dXJuIDAgaW5zdGVhZCBvZiByZXQgZm9yIHN1Y2Nlc3MuCj4+Pj4gIMKgIC0g
QWRkZWQgc3BhcnNlIGFubm90YXRpb25zIGFyb3VuZCBpM2NfZ2VuaV9ydW50aW1lX2dldF9tdXRl
eF9sb2NrKCkvX3VubG9jaygpLgo+Pj4KPj4+IFNvIHRoaXMgaXMgdGhlIHRoaXJkIHRpbWUgSSBn
b3QgdGhpcyByZXZpc2lvbiBpbiBteSBpbmJveCwgcHJldmlvdXMgd2VyZQo+Pj4gPDIwMjUwNDEw
MDg0ODEzLjM1OTQ0MzYtMS1xdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPiAxMC4wNAo+Pj4gPDIw
MjUwMzMxMTY0NjQ4LjIzMjE4OTktMS1xdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPiAzMS4wMwo+
Pj4KPj4+IGI0IHNob3VsZCBiZSBhdXRvbWF0aWNhbGx5IHVwdGlja2luZyB0aGUgcmV2aXNpb24g
Y291bnRlciwgcGxlYXNlIGRvbid0IG1lc3MKPj4+IHdpdGggaXQgbWFudWFsbHkKPj4gU29ycnkg
S29ucmFkLCBpIGNvdWxkIG5vdCB1bmRlcnN0YW5kIHdoYXQncyB0aGUgcHJvYmxlbSBvciB3aGF0
IHlvdSBhcmUgdHJ5aW5nIHRvIHNheS4KPj4KPj4gRG8geW91IHN1c3BlY3Qgc29tZXRoaW5nIChX
aGljaCBpIGRpZG50IGdldCkgaXMgc2VlbiBhcyBtYW51YWxseSBjaGFuZ2VkID8KPiAKPiBZZXMs
IG5vcm1hbGx5IGVhY2ggJ2I0IHNlbmQnIHVwdGlja3MgdGhlIHJldmlzaW9uIGNvdW50ZXIsIGJ1
dCBoZXJlIHdlIGdvdAo+IGEgY291cGxlIHN1Ym1pc3Npb25zIGFsbCB3aXRoIHY0Cj4gClNvcnJ5
IGZvciBjb25mdXNpb24sIGZpcnN0IG9uZSB3YXMgc2VudCB0byBpbnRlcm5hbCBmb3IgcmV2aWV3
IChsaW1pdGVkIAotLXRvIGxpc3QpLiBMYXRlciBpIHNlbmQgdG8gdXBzdHJlYW0uCj4gS29ucmFk
CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
