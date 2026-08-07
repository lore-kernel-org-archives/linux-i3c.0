Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E737C5AC7A
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJziVKtv63EAM7dCOhpzZCydpM86WtHjc4umlxW9+T0=; b=X2cpkwBMRo6L+R
	tl2+SecpAiZrLwl+V2lqFEV1+VrAy18icXOBi5J+sI2jnLX6TFWjFddX3dTvRE6z7hFyi60qv96Oa
	f8cgIVvEJ0Y7/ufC3jZ34Kco11kmlqXtAsnmQCpi3RHmpZrcIlOIaejzBpjfRLCRR08UWcr4/lktK
	86cpfEAAcoCpJiZL2jCNi2npM70cBbSiW/hEGShtOU69jI/AtM46YZ8plWp51wFEgJ7sHEgdIhsD8
	+8GhfWvRxRNOvDnmh+mULIaaVD9MlmvV3oddoPxksGSCFmqo+qeRY9SifciLO4Gx6jjKWQPHAyRWB
	ECbrNjkWzb6LzgV78rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMSw-00000008KnM-1QaI;
	Fri, 07 Aug 2026 15:26:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMSu-00000008Kmv-11ZF
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 15:26:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C4D0600BB;
	Fri,  7 Aug 2026 15:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94091F00A3A;
	Fri,  7 Aug 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786116391;
	bh=fddBzK07EXdLO26iWtIly/YQlLIdZ6U70YGNNqJfWQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E6EW6s510slvrpFWGN0sCaG0ekBbkcpapVOOtmj+aR7jVvzIxthsHvdJfogKi0rCa
	 9rRVtBV6wu1x6OSCKITXb2BoBCLO91g5cO9MYR4D5pGHtAFOz1P6gd1EqBTEtkFmPL
	 Lcb7NCur2Emg8Tu0H7fzDus9ixhCYFuU4h8zE0jWVfCgJ4+C5MjPf85tntmX3vNS0B
	 4cX9CABxTL3TKVZfsZfveAEu1KnnA+WcQtyZTa8YrtoFtblmgyr+aLpc37NmPv9j6T
	 HMRbo2nTPdk3oMWhgUqeoQryHd9/H6n5fcjO/taxt5xeTDVfLa9MMigQSK0hHWRX0c
	 YRqjitVq7KbpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 11/14] i3c: master: Reject IBI requests from
 non-IBI-capable devices
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-pci@vger.kernel.org
In-Reply-To: <20260807145638.168865-12-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
 <20260807145638.168865-12-adrian.hunter@intel.com>
Date: Fri, 07 Aug 2026 15:26:30 +0000
Message-Id: <20260807152630.C94091F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBXb3JrcXVldWUgbWVtb3J5IGFuZCByZXNjdWVyIHRocmVhZCBsZWFrIG9uIHRoZSBl
cnJvciBwYXRoIG9mIGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkLgotLQoKLS0tIFBhdGNoIFsx
MV06IFtQQVRDSCBWNSAxMS8xNF0gaTNjOiBtYXN0ZXI6IFJlamVjdCBJQkkgcmVxdWVzdHMgZnJv
bSBub24tSUJJLWNhcGFibGUgZGV2aWNlcyAtLS0KY29tbWl0IGQ2YzU1MTIzZjczMWZmMTU3MjVk
ODlkMmY5YjNmZWYwZjg3OWVmYTkKQXV0aG9yOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVy
QGludGVsLmNvbT4KCmkzYzogbWFzdGVyOiBSZWplY3QgSUJJIHJlcXVlc3RzIGZyb20gbm9uLUlC
SS1jYXBhYmxlIGRldmljZXMKClRoaXMgcGF0Y2ggY2hlY2tzIGlmIGEgZGV2aWNlIGFkdmVydGlz
ZXMgSUJJIHN1cHBvcnQgYmVmb3JlIGF0dGVtcHRpbmcgdG8Kc2V0IHVwIElCSSBoYW5kbGluZy4g
SXQgYWRkcyBhIGNoZWNrIGZvciBJM0NfQkNSX0lCSV9SRVFfQ0FQIGluCmkzY19kZXZpY2VfcmVx
dWVzdF9pYmkoKSBhbmQgcmV0dXJucyAtRU9QTk9UU1VQUCBpZiBub3Qgc3VwcG9ydGVkLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvZGV2aWNlLmMgYi9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+
IC0tLSBhL2RyaXZlcnMvaTNjL2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9pM2MvZGV2aWNlLmMK
WyAuLi4gXQo+IEBAIC0yMDQsMTIgKzIwNCwxNCBAQCBpbnQgaTNjX2RldmljZV9yZXF1ZXN0X2li
aShzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LAo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICAJaTNjX2J1
c19ub3JtYWx1c2VfbG9jayhkZXYtPmJ1cyk7Cj4gLQlpZiAoZGV2LT5kZXNjKSB7Cj4gKwlpZiAo
IWRldi0+ZGVzYykgewo+ICsJCXJldCA9IC1FTk9FTlQ7Cj4gKwl9IGVsc2UgaWYgKCEoZGV2LT5k
ZXNjLT5pbmZvLmJjciAmIEkzQ19CQ1JfSUJJX1JFUV9DQVApKSB7Cj4gKwkJcmV0ID0gLUVPUE5P
VFNVUFA7Cj4gKwl9IGVsc2Ugewo+ICAJCW11dGV4X2xvY2soJmRldi0+ZGVzYy0+aWJpX2xvY2sp
Owo+ICAJCXJldCA9IGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKGRldi0+ZGVzYywgcmVxKTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGxvb2tp
bmcgYXQgdGhlIGVycm9yIHBhdGggb2YKaTNjX2Rldl9yZXF1ZXN0X2liaV9sb2NrZWQoKSBpbiBk
cml2ZXJzL2kzYy9tYXN0ZXIuYywgZG9lcyBpdCBsZWFrIHRoZQp3b3JrcXVldWUgYW5kIGl0cyBy
ZXNjdWVyIHRocmVhZCBpZiB0aGUgaGFyZHdhcmUgZHJpdmVyIGZhaWxzIHRoZSByZXF1ZXN0PwoK
ZHJpdmVycy9pM2MvbWFzdGVyLmM6aTNjX2Rldl9yZXF1ZXN0X2liaV9sb2NrZWQoKSB7CiAgICAu
Li4KCWliaS0+d3EgPSBhbGxvY19vcmRlcmVkX3dvcmtxdWV1ZShkZXZfbmFtZShpM2NkZXZfdG9f
ZGV2KGRldi0+ZGV2KSksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFdRX01FTV9SRUNMQUlNKTsKCWlmICghaWJpLT53cSkgewoJCWtmcmVlKGliaSk7CgkJcmV0dXJu
IC1FTk9NRU07Cgl9CiAgICAuLi4KCXJldCA9IG1hc3Rlci0+b3BzLT5yZXF1ZXN0X2liaShkZXYs
IHJlcSk7CglpZiAocmV0KSB7CgkJa2ZyZWUoaWJpKTsKCQlkZXYtPmliaSA9IE5VTEw7Cgl9CgoJ
cmV0dXJuIHJldDsKfQoKV2hlbiBhIGRldmljZSBkcml2ZXIgcmVxdWVzdHMgYW4gSUJJIGFuZCB0
aGUgYnVzIGNvbnRyb2xsZXIgZmFpbHMgdGhlCnJlcXVlc3QsIHRoZSBpYmkgc3RydWN0IGlzIGZy
ZWVkIGJ1dCBkZXN0cm95X3dvcmtxdWV1ZSgpIGlzIG5ldmVyIGNhbGxlZC4KU2luY2UgdGhlIHdv
cmtxdWV1ZSBpcyBjcmVhdGVkIHdpdGggV1FfTUVNX1JFQ0xBSU0sIHdvdWxkbid0IHRoaXMgbGVh
ayBhCmtlcm5lbCB0YXNrIGFuZCBpdHMgYXNzb2NpYXRlZCBtZW1vcnkgb24gZXZlcnkgZmFpbHVy
ZT8KCj4gIAkJbXV0ZXhfdW5sb2NrKCZkZXYtPmRlc2MtPmliaV9sb2NrKTsKPiAtCX0gZWxzZSB7
Cj4gLQkJcmV0ID0gLUVOT0VOVDsKPiAgCX0KPiAgCWkzY19idXNfbm9ybWFsdXNlX3VubG9jayhk
ZXYtPmJ1cyk7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYwODA3MTQ1NjM4LjE2ODg2NS0xLWFkcmlhbi5odW50ZXJAaW50ZWwuY29t
P3BhcnQ9MTEKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
