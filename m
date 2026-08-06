Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F74C56208
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th9WoCwUaO/Qvr3r8tf8Ks4RlWl31nut3yL0PXNQgJE=; b=GiLjdbZQS6AlDF
	YlctZUuYEFjjv+3Aj90X0fJ79j3b9XSi45k/n963lplDBGGI1EKvh6kMnHYqnye4XSeZkgaMgG4Y3
	li7z9o/bUStQvwq4XIWYbqGqauAk5+Tl7RaP0wAqOskOvSjyVPTNX9DB3BkG49wknut3+rKdvjIs0
	H4MEJvSgKepLz5j6kesiZG7CWqdMQG7787/AP0TSykAPjZP+0qYLdWRlq2J+h4bChApdne1CR8B4N
	kQP5TaVSUsEka1dpznYmlrov2xXP1IMMcS9G8IiwCy3mWUTo4nwsiwJPUTJ062SOVnjd7YLUnAqqf
	LrOc+atfdgjn/QVq89xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryTx-00000005w7u-37iJ;
	Thu, 06 Aug 2026 13:50:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryTw-00000005w72-3S0B
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 13:50:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B7D141753;
	Thu,  6 Aug 2026 13:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A494B1F00A3A;
	Thu,  6 Aug 2026 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024200;
	bh=mzx55sYR17rtWzeVrQP3jxEurNyMq6DyCUsbSTvjsNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3RP9lbjtTT1JI2v9v0+1QN6f8U7hKGY+S8TKFWQbufG1I1xaZDWDPQxgFv336Nax
	 5ttcYUEol5PPolrQefkbg3FysQgHyBNoaCYYNVzw1Z6570rlm5Vc3ESXmT4xs6QOh5
	 X8m28FzDKB0Ar6bQl85k0M2jeZz0TXWrBmGlt8RDEBByaHTZ0XtYTXCibVOP9Gz+qd
	 sKKK6EDTJfdT2h7Fmy+KIX1ST4xIfFllJM0pznTn86sCRFuWULljEvTfGPlsg/qj/q
	 YjWyXny38KbEiI4WJxNAirEMJqPSNDt91IXRTrZDjoXVeEHSypnLZJGa7yCX3opisY
	 nAztivRsse+/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 09/14] i3c: master: Report wakeup events for IBIs
To: "Adrian Hunter" <adrian.hunter@intel.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-pci@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260806131857.119830-10-adrian.hunter@intel.com>
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-10-adrian.hunter@intel.com>
Date: Thu, 06 Aug 2026 13:49:59 +0000
Message-Id: <20260806134959.A494B1F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBO
VUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gYGkzY19tYXN0ZXJfcXVldWVfaWJpKClgIHdoZW4g
YWNjZXNzaW5nIGBkZXYtPmRldmAuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtIaWdoXSBSYWNl
IGNvbmRpdGlvbiBpbiBgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoKWAgbGVhZGluZyB0byBVc2UtQWZ0
ZXItRnJlZSBvZiBgZGV2LT5pYmlgLgotLQoKLS0tIFBhdGNoIFs5XTogW1BBVENIIFY0IDA5LzE0
XSBpM2M6IG1hc3RlcjogUmVwb3J0IHdha2V1cCBldmVudHMgZm9yIElCSXMgLS0tCmNvbW1pdCA0
NjFhNDlhYzZiZWRmOTQ2NzUzOWFhOGZhYzU1ODNiZjc3YWQ1MDQ1CkF1dGhvcjogQWRyaWFuIEh1
bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgppM2M6IG1hc3RlcjogUmVwb3J0IHdha2V1
cCBldmVudHMgZm9yIElCSXMKCkFuIEkzQyBkZXZpY2UgY29uZmlndXJlZCBhcyBhIHdha2V1cCBz
b3VyY2UgY2FuIHdha2UgdGhlIHN5c3RlbSBieQpnZW5lcmF0aW5nIGFuIEluLUJhbmQgSW50ZXJy
dXB0IChJQkkpLiBXaGVuIGFuIElCSSBpcyBxdWV1ZWQgZm9yCnByb2Nlc3NpbmcsIHJlY29yZCBh
IHdha2V1cCBldmVudCBmb3IgdGhlIGRldmljZSBpZiB3YWtldXAgaXMgZW5hYmxlZC4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBp
bmRleCAyNjE2MzU0ZGJlNTQ1Li42YzUzNDE0OTE5NDQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKClsgLi4uIF0KCj4gQEAg
LTMzOTcsNiArMzQwMCw5IEBAIHZvaWQgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoc3RydWN0IGkzY19k
ZXZfZGVzYyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9zbG90ICpzbG90KQo+ICAJaWYgKCFkZXYtPmli
aSB8fCAhc2xvdCkKPiAgCQlyZXR1cm47Cj4gIAo+ICsJaWYgKGRldmljZV9tYXlfd2FrZXVwKCZk
ZXYtPmRldi0+ZGV2KSkKPiArCQlwbV93YWtldXBfZXZlbnQoJmRldi0+ZGV2LT5kZXYsIEkzQ19X
QUtFVVBfUFJPQ0VTU0lOR19USU1FX01TKTsKPiArCgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiBkZXYt
PmRldiBiZSBOVUxMIGhlcmU/CgpMb29raW5nIGF0IGkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2Nf
ZGV2cygpLCBpdCBzZXRzIGkzY2Rldi0+ZGV2IHRvIE5VTEwKZHVyaW5nIGRldmljZSB0ZWFyZG93
bjoKCmRyaXZlcnMvaTNjL21hc3Rlci5jOmkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cygp
IHsKICAgIC4uLgoJCWkzY2Rldi0+ZGV2LT5kZXNjID0gTlVMTDsKCQlwdXRfZGV2aWNlKCZpM2Nk
ZXYtPmRldi0+ZGV2KTsKCQlpM2NkZXYtPmRldiA9IE5VTEw7Cgl9Cn0KCklmIGEgaGFyZHdhcmUg
SUJJIGlzIHJlY2VpdmVkIGR1cmluZyBvciBzaG9ydGx5IGFmdGVyIHRoaXMgdGVhcmRvd24sCndv
dWxkbid0IGFjY2Vzc2luZyAmZGV2LT5kZXYtPmRldiBjYXVzZSBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSB3aGVuCmV2YWx1YXRlZCBpbnNpZGUgZGV2aWNlX21heV93YWtldXAoKT8KCj4gIAlh
dG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsKCltTZXZlcml0eTogSGlnaF0KVGhp
cyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhlIGxhY2sgb2Ygc3luY2hyb25p
emF0aW9uIGhlcmUgYWxsb3cKYSB1c2UtYWZ0ZXItZnJlZSBvZiBkZXYtPmliaT8KClRoZSB0ZWFy
ZG93biBwYXRoIGluIGkzY19kZXZfZGlzYWJsZV9pYmlfbG9ja2VkKCkgY2hlY2tzIHBlbmRpbmdf
aWJpcwpsb2NrbGVzc2x5IGFuZCBieXBhc3NlcyB3YWl0aW5nIGlmIGl0IHJlYWRzIDA6Cgpkcml2
ZXJzL2kzYy9tYXN0ZXIuYzppM2NfZGV2X2Rpc2FibGVfaWJpX2xvY2tlZCgpIHsKICAgIC4uLgoJ
aWYgKGF0b21pY19yZWFkKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKSkKCQl3YWl0X2Zvcl9jb21w
bGV0aW9uKCZkZXYtPmliaS0+YWxsX2liaXNfaGFuZGxlZCk7CiAgICAuLi4KfQoKSWYgYW4gSVNS
IGlzIGV4ZWN1dGluZyBjb25jdXJyZW50bHkgYW5kIHBhc3NlcyB0aGUgY2hlY2sgZm9yICFkZXYt
PmliaSBhdAp0aGUgdG9wIG9mIGkzY19tYXN0ZXJfcXVldWVfaWJpKCksIGJ1dCBoYXNuJ3QgeWV0
IHJlYWNoZWQgdGhlIGF0b21pY19pbmMoKQpoZXJlLCB0aGUgdGVhcmRvd24gdGhyZWFkIGNvdWxk
IHNlZSBwZW5kaW5nX2liaXMgPT0gMCBhbmQgcHJvY2VlZCB0byBmcmVlCmRldi0+aWJpIGluIGkz
Y19kZXZfZnJlZV9pYmlfbG9ja2VkKCk6Cgpkcml2ZXJzL2kzYy9tYXN0ZXIuYzppM2NfZGV2X2Zy
ZWVfaWJpX2xvY2tlZCgpIHsKICAgIC4uLgoJa2ZyZWUoZGV2LT5pYmkpOwoJZGV2LT5pYmkgPSBO
VUxMOwogICAgLi4uCn0KCldoZW4gdGhlIElTUiByZXN1bWVzLCB3b3VsZG4ndCB0aGUgc3Vic2Vx
dWVudCBhY2Nlc3NlcyB0bwpkZXYtPmliaS0+cGVuZGluZ19pYmlzIGFuZCBkZXYtPmliaS0+d3Eg
Y2F1c2UgYSB1c2UtYWZ0ZXItZnJlZT8gQWRkaW5nCnRoZSB3YWtldXAgZXZlbnQgbG9naWMgc2xp
Z2h0bHkgd2lkZW5zIHRoaXMgZXhpc3RpbmcgcmFjZSB3aW5kb3cuCgo+ICAJcXVldWVfd29yayhk
ZXYtPmliaS0+d3EsICZzbG90LT53b3JrKTsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNjEzMTg1Ny4xMTk4MzAtMS1h
ZHJpYW4uaHVudGVyQGludGVsLmNvbT9wYXJ0PTkKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0
CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
